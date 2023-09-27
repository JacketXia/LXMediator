//
//  LXRouter.m
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import "LXRouter.h"
#import "LXControllerManager.h"
#import "LXRouter+Navigator.h"

@interface LXRouter()

@property (nonatomic, strong) UIViewController *routerVC;

@end

@implementation LXRouter

+ (LXRouter * (^)(NSString *_Nonnull name,NSDictionary * _Nullable params))onName {
    return ^LXRouter *(NSString *_Nonnull name,NSDictionary * _Nullable params){
        LXRouter *router = [[LXRouter alloc] init];
        
        // 是否需要拦截
        NSMutableDictionary<NSString *,LXRouterInterceptorHandle> *interceptorNames = [LXStorage shared].interceptorNames;
        BOOL needInterceptor = [interceptorNames.allKeys containsObject:name];
        if (needInterceptor) {
            LXRouterInterceptorHandle handle = interceptorNames[name];
            BOOL show = handle(name,params);
            if (NO == show) {
                return router;
            }
        }
        
        router.routerVC = LXGetController(name, params);
        return router;
    };
}

+ (LXRouter * (^)(UIViewController *_Nonnull vc))onVC {
    return ^LXRouter *(UIViewController *_Nonnull vc){
        LXRouter *router = [[LXRouter alloc] init];
        router.routerVC = vc;
        return router;
    };
}

- (void(^)(BOOL animated))onPush {
    return ^(BOOL animated){
        if (self.routerVC) {
            [self pushViewController:self.routerVC animated:animated];
        }
    };
}

- (void(^)(BOOL animated,void (^ __nullable completion)(void)))onPresent {
    return ^(BOOL animated,void (^ __nullable completion)(void)){
        if (self.routerVC) {
            [self presentViewController:self.routerVC animated:animated completion:completion];
        }
    };
}

- (void(^)(BOOL animated))onReplace {
    return ^(BOOL animated){
        if (self.routerVC) {
            [self replaceViewController:self.routerVC animated:animated];
        }
    };
}

+ (void)registerInterceptorName:(NSString * _Nonnull)name handle:(nonnull LXRouterInterceptorHandle)handle {
    if (!handle) {
        return;
    }
    [LXStorage shared].interceptorNames[name] = handle;
}

@end
