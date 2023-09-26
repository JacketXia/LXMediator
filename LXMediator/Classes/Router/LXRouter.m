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

//+ (LXRouter * (^)(NSString *_Nonnull name))onName {
//    return ^LXRouter *(NSString *_Nonnull name){
//        LXRouter *router = [[LXRouter alloc] init];
//        router.routerVC = [LXControllerManager getControllerWithName:name];
//        return router;
//    };
//}
//
//+ (LXRouter * (^)(UIViewController *_Nonnull vc))onVC {
//    return ^LXRouter *(UIViewController *_Nonnull vc){
//        LXRouter *router = [[LXRouter alloc] init];
//        router.routerVC = vc;
//        return router;
//    };
//}
//
//- (LXRouter * (^)(NSDictionary *_Nonnull param))onParam {
//    return ^LXRouter *(NSDictionary *_Nonnull param){
//        [LXControllerManager controller:self.routerVC setParam:param];
//        return self;
//    };
//}
//
//- (void(^)(BOOL animated))onPush {
//    return ^(BOOL animated){
//        [[[self class] topViewController].navigationController pushViewController:self.routerVC animated:animated];
//    };
//}
//
//- (void(^)(BOOL animated,void (^ __nullable completion)(void)))onPresent {
//    return ^(BOOL animated,void (^ __nullable completion)(void)){
//        [[[self class] topViewController] presentViewController:self.routerVC animated:animated completion:completion];
//    };
//}
//
//- (void(^)(BOOL animated))onReplace {
//    return ^(BOOL animated){
//        NSMutableArray *controllers = [[[self class] topViewController].navigationController.viewControllers mutableCopy];
//        [controllers replaceObjectAtIndex:controllers.count - 1 withObject:self.routerVC];
//        [[[self class] topViewController].navigationController setViewControllers:controllers animated:animated];
//    };
//}
//
//+ (void(^)(BOOL animated))onPop {
//    return ^(BOOL animated) {
//        [[self topViewController].navigationController popViewControllerAnimated:animated];
//    };
//}
//
//+ (void(^)(BOOL animated))onPopRoot {
//    return ^(BOOL animated) {
//        [[self topViewController].navigationController popToRootViewControllerAnimated:YES];
//    };
//}
//
//+ (void(^)(NSString *_Nonnull tag, BOOL animated))onPopTag {
//    return ^(NSString *_Nonnull tag, BOOL animated) {
//        UIViewController *topController = [self topViewController];
//        for (UIViewController *vc in topController.navigationController.viewControllers) {
//            if ([vc conformsToProtocol:@protocol(LXControllerDelegate)] && [vc respondsToSelector:@selector(lx_routeTag)]) {
//                NSString *routeTag = [vc performSelector:@selector(lx_routeTag)];
//                if ([routeTag isEqual:tag]) {
//                    [topController.navigationController popToViewController:vc animated:animated];
//                    break;
//                }
//            }
//        }
//    };
//}
//
//+ (void(^)(BOOL animated,void (^ __nullable completion)(void)))onDismiss {
//    return ^(BOOL animated,void (^ __nullable completion)(void)){
//        [[self topViewController] dismissViewControllerAnimated:animated completion:completion];
//    };
//}

#pragma mark- 获取控制器 -


@end
