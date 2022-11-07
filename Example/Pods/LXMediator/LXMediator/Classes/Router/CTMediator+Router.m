//
//  CTMediator+Route.m
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import "CTMediator+Router.h"
#import <UIKit/UIKit.h>
#import "CTMediator+HandyTools.h"

//  字符串 是类名 Target_xxx.h 中的 xxx 部分
NSString * const kCTMediatorTarget_Route = @"Router";

//  字符串是 Target_xxx.h 中 定义的 Action_xxxx 函数名的 xxx 部分
NSString * const kCTMediatorAction_GetViewController = @"GetViewController";

@implementation CTMediator (Router)

- (void)pushRoute:(NSString *_Nonnull)route params:(NSDictionary *_Nullable)params animated:(BOOL)animated {
    if (route.length == 0) {
        return;
    }
    NSMutableDictionary *routeParams = [NSMutableDictionary dictionary];
    routeParams[@"routeName"] = route;
    if ([params isKindOfClass:[NSDictionary class]]) {
        routeParams[@"params"] = params;
    }
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Route
                                                    action:kCTMediatorAction_GetViewController
                                                    params:routeParams shouldCacheTarget:NO];
    [self pushViewController:viewController animated:animated];
}

- (void)presentRoute:(NSString *_Nonnull)route params:(NSDictionary *_Nullable)params animated:(BOOL)animated completion:(void(^_Nullable)(void)) completion {
    if (route.length == 0) {
        return;
    }
    NSMutableDictionary *routeParams = [NSMutableDictionary dictionary];
    routeParams[@"routeName"] = route;
    if ([params isKindOfClass:[NSDictionary class]]) {
        routeParams[@"params"] = params;
    }
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_Route
                                                    action:kCTMediatorAction_GetViewController
                                                    params:routeParams shouldCacheTarget:NO];
    [self presentViewController:viewController animated:animated completion:completion];
}

- (void)popAnimated:(BOOL)animated completion:(void(^_Nullable)(void)) completion {
    
    UIViewController *topViewController = [self topViewController];
    UINavigationController *navigationController = (UINavigationController *)topViewController;
    
    if ([navigationController isKindOfClass:[UINavigationController class]] == NO) {
        if ([navigationController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabbarController = (UITabBarController *)navigationController;
            navigationController = tabbarController.selectedViewController;
            if ([navigationController isKindOfClass:[UINavigationController class]] == NO) {
                navigationController = tabbarController.selectedViewController.navigationController;
            }
        } else {
            navigationController = navigationController.navigationController;
        }
    }
    
    if ([navigationController isKindOfClass:[UINavigationController class]] && navigationController.viewControllers.count > 1) {
        [navigationController popViewControllerAnimated:animated];
        !completion ?: completion();
    }else {
        [topViewController dismissViewControllerAnimated:animated completion:completion];
    }
}

@end
