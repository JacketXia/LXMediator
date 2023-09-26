//
//  LXRouter.h
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import "LXRouter+Navigator.h"

@implementation LXRouter (Navigator)

+ (UIViewController *)rootViewController {
    //获取根控制器
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    UIViewController *parent = rootVC;
    //遍历 如果是presentViewController
    while ((parent = rootVC.presentedViewController) != nil ) {
        rootVC = parent;
    }
    return rootVC;
}

+ (UIViewController * _Nullable)topViewController {
    UIViewController *topViewController = [self rootViewController];
    if ([topViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbarController = (UITabBarController *)topViewController;
        topViewController = tabbarController.selectedViewController;
    }
    if ([topViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)topViewController;
        topViewController = navigationController.topViewController;
    }
    return topViewController;
}

@end
