//
//  LXController.m
//  LXMediator
//
//  Created by JacketXia on 2022/12/23.
//

#import "LXControllerManager.h"
#import "LXModuleMediator.h"
#import "LXControllerDelegate.h"

@interface LXControllerManager ()



@end

@implementation LXControllerManager



+ (void)registerRedirectName:(NSString * _Nonnull)name handle:(nonnull LXControllerRedirectHandle)handle {
    if (!handle) {
        return;
    }
    [LXStorage shared].redirectNames[name] = handle;
}

+ (void)registerNotFound:(nonnull LXControllerNotFoundHandle)handle {
    [LXStorage shared].notFoundHandle = handle;
}

//MARK: 逻辑处理
+ (UIViewController *)getControllerWithName:(NSString *_Nonnull)name params:(NSDictionary *_Nullable)params {
    
    // 是否需要重定向
    NSMutableDictionary<NSString *,LXControllerRedirectHandle> *redirectNames = [LXStorage shared].redirectNames;
    BOOL needRedirect = [redirectNames.allKeys containsObject:name];
    if (needRedirect) {
        LXControllerRedirectHandle handle = redirectNames[name];
        UIViewController *redirectVC = handle(name,params);
        if (redirectVC != nil) {
            return redirectVC;
        }
    }
    
    // 创建控制器实例
    Class cls = [[LXModuleMediator shared] getClassWithName:name];
    UIViewController *controller = [[cls alloc] init];
    
    // 找不到路由处理
    if (!controller || ![controller isKindOfClass:[UIViewController class]]) {
        LXControllerNotFoundHandle notFoundHandle = [LXStorage shared].notFoundHandle;
        if (notFoundHandle) {
            return notFoundHandle(name,params);
        }else {
            UIViewController *notFoundVC = [[UIViewController alloc] init];
            return notFoundVC;
        }
    }
    
    /// 设置参数
    if([controller conformsToProtocol:@protocol(LXControllerDelegate)]){
        if (params && [controller respondsToSelector:@selector(lx_initializeParam:)]) {
            [controller performSelector:@selector(lx_initializeParam:) withObject:params];
        }
    }else {
        /// 未遵从协议也可以使用，可能会删除
        if (params && [controller respondsToSelector:@selector(lx_initializeParam:)]) {
            [controller performSelector:@selector(lx_initializeParam:) withObject:params];
        }
    }
    return controller;
}

@end

inline UIViewController* LXGetController(NSString * name, NSDictionary * _Nullable params) {
    UIViewController *vc = [LXControllerManager getControllerWithName:name params:params];
    return vc;
}
