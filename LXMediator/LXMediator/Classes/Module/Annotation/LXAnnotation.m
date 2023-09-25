//
//  LXAnnotation.m
//  LXLib
//
//  Created by JacketXia on 2022/12/23.
//

#include <mach-o/getsect.h>
#include <mach-o/dyld.h>
#import "LXModuleMediator.h"
#import "LXAnnotation.h"

@implementation LXAnnotation

@end

#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
NSArray<NSString*>* LXReadSlot(char* sectionName,const struct mach_header* mhd) {
    unsigned long size = 0;
    NSMutableArray* slots = [[NSMutableArray alloc] init];
    const struct mach_header_64 *mhp64 = (struct mach_header_64 *)mhd;
    uintptr_t *memory = (uintptr_t*)getsectiondata(mhp64, SEG_DATA, sectionName, &size);
    NSUInteger count = size / sizeof(void*);
    for(int idx = 0; idx < count; ++idx){
        char *string = (char*)memory[idx];
        if(string == NULL) break;
        NSString *str = [NSString stringWithUTF8String:string];
        if(str.length == 0)break;
        if(str) [slots addObject:str];
    }
    return [slots copy];
}

static void dyld_callback(const struct mach_header *mhp, intptr_t vmaddr_slide){
    NSArray<NSString *> *routes = LXReadSlot(_LXIMPCONT, mhp);
    for (NSString *desc in routes) {
        NSData* jsonData = [desc dataUsingEncoding:NSUTF8StringEncoding];
        NSError* e = nil;
        id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&e];
        if(!e){
            if([json isKindOfClass:NSDictionary.class] && [json allKeys].count){
                NSString *name = [json allKeys][0];
                NSString *clsName  = ((NSDictionary *)json)[name];
                if(name.length > 0 && clsName.length > 0){
                    [[LXModuleMediator shared] registerClass:NSClassFromString(clsName) WithName:name];
                }
            }
        }
    }
    
    NSArray<NSString *> *services = LXReadSlot(_LXIMPSERVICE, mhp);
    for (NSString *desc in services) {
        NSData* jsonData = [desc dataUsingEncoding:NSUTF8StringEncoding];
        NSError* e = nil;
        id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&e];
        if(!e){
            if([json isKindOfClass:NSDictionary.class] && [json allKeys].count){
                NSString *name = [json allKeys][0];
                NSString *clsName  = ((NSDictionary *)json)[name];
                if(name.length > 0 && clsName.length > 0){
                    [[LXModuleMediator shared] registerClass:NSClassFromString(clsName) WithProtocol:NSProtocolFromString(name)];
                }
            }
        }
    }
}

__attribute__((constructor(100)))
void initModule(void) {
    _dyld_register_func_for_add_image(dyld_callback);
}
