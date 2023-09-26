//
//  LXRouter.h
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import "LXRouter+Navigator.h"

@implementation LXRouter (Navigator)

- (UIWindow *)keyWindow {
    return [[UIApplication sharedApplication].delegate window];
}

- (UIViewController *)topViewController {
    UIViewController *topController = [self keyWindow].rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UINavigationController *navigationController = (UINavigationController *)[self topViewController];
    
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
    
    if ([navigationController isKindOfClass:[UINavigationController class]]) {
        [navigationController pushViewController:viewController animated:animated];
    }
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion {
    UIViewController *viewController = [self topViewController];
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        viewController = navigationController.topViewController;
    }
    
    if ([viewController isKindOfClass:[UIAlertController class]]) {
        UIViewController *viewControllerToUse = viewController.presentingViewController;
        [viewController dismissViewControllerAnimated:false completion:nil];
        viewController = viewControllerToUse;
    }
    
    if (viewController) {
        [viewController presentViewController:viewControllerToPresent animated:animated completion:completion];
    }
}

- (void)replaceViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UINavigationController *navigationController = (UINavigationController *)[self topViewController];
    
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
    
    if ([navigationController isKindOfClass:[UINavigationController class]]) {
        NSMutableArray *controllers = [navigationController.viewControllers mutableCopy];
        [controllers replaceObjectAtIndex:controllers.count - 1 withObject:viewController];
        [navigationController setViewControllers:controllers animated:animated];
    }
}

@end
