//
//  LXModule.m
//  LXMediator
//
//  Created by JacketXia on 2022/12/23.
//

#import "LXModuleMediator.h"

@implementation LXModuleMediator {
    NSMutableDictionary<NSString *,Class> *_regModules;
    dispatch_semaphore_t _sem;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _regModules = [NSMutableDictionary dictionary];
        _sem = dispatch_semaphore_create(1);
    }
    return self;
}

+ (instancetype)shared {
    static LXModuleMediator *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LXModuleMediator alloc] init];
    });
    return instance;
}

- (void)registerClass:(Class)cls WithName:(NSString *)name {
#if DEBUG
    NSAssert(name.length > 0, @"module name %@ is empty",name);
    NSAssert(cls != nil, @"module name %@ is empty",name);
#endif
    if(name.length == 0 || cls == nil){
        return;
    }
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
#if DEBUG
    NSAssert(!_regModules[name], @"module %@ 已存在,重复注册",name);
#endif
    _regModules[name] = cls;
    dispatch_semaphore_signal(_sem);
}

- (void)registerClass:(Class)cls WithProtocol:(Protocol *)proto {
    [self registerClass:cls WithName:NSStringFromProtocol(proto)];
}

- (Class)getClassWithName:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    return _regModules[name];
}

- (Class)getClassWithProtocol:(Protocol *)proto {
    return [self getClassWithName:NSStringFromProtocol(proto)];
}

@end

