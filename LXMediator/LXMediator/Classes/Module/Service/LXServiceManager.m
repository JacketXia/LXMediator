//
//  LXService.m
//  LXMediator
//
//  Created by JacketXia on 2023/2/10.
//

#import "LXServiceManager.h"
#import "LXModuleMediator.h"

@implementation LXServiceManager

+ (id)getServiceImpWithProtocol:(Protocol *)proto {
    Class class = [[LXModuleMediator shared] getClassWithProtocol:proto];
    if(DEBUG) {
        NSAssert(class,@"未找到该协议实现");
    }
    NSObject *instance = [[class alloc] init];
    if(DEBUG) {
        NSAssert([class conformsToProtocol:proto],@"该实例未遵循协议");
    }
    return instance;
}

+ (id)getServiceImpWithName:(NSString *)protoName {
    Class class = [[LXModuleMediator shared] getClassWithName:protoName];
    if(DEBUG) {
        NSAssert(class,@"未找到该协议实现");
    }
    NSObject *instance = [[class alloc] init];
    if(DEBUG) {
        NSAssert([class conformsToProtocol:NSProtocolFromString(protoName)],@"该实例未遵循协议");
    }
    return instance;
}

@end

