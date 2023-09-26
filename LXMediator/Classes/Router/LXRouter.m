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
        [self pushViewController:self.routerVC animated:animated];
    };
}

- (void(^)(BOOL animated,void (^ __nullable completion)(void)))onPresent {
    return ^(BOOL animated,void (^ __nullable completion)(void)){
        [self presentViewController:self.routerVC animated:animated completion:completion];
    };
}

- (void(^)(BOOL animated))onReplace {
    return ^(BOOL animated){
        [self replaceViewController:self.routerVC animated:animated];
    };
}

@end
