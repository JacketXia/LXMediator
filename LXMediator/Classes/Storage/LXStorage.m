//
//  LXStorage.m
//  LXMediator
//
//  Created by JacketXia on 2023/9/27.
//

#import "LXStorage.h"

@implementation LXStorage

+ (instancetype)shared {
    static LXStorage *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LXStorage alloc] init];
    });
    return instance;
}

- (NSMutableDictionary<NSString *,LXControllerRedirectHandle> *)redirectNames {
    if (!_redirectNames) {
        _redirectNames = [NSMutableDictionary dictionary];
    }
    return _redirectNames;
}

- (NSMutableDictionary<NSString *,LXRouterInterceptorHandle> *)interceptorNames {
    if (!_interceptorNames) {
        _interceptorNames = [NSMutableDictionary dictionary];
    }
    return _interceptorNames;
}

@end
