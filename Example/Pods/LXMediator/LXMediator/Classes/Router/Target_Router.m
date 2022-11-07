//
//  Target_Route.m
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import "Target_Router.h"
#import "LXErrorViewController.h"

@implementation Target_Router

- (UIViewController *)Action_GetViewController:(NSDictionary *)param {
    
    NSString *routeName = param[@"routeName"];
    NSDictionary *dictionary = param[@"params"];
    
    Class targetClass = NSClassFromString(routeName);
    if (targetClass == nil) {
        // 生成类失败
        return [self errorViewController:@"路由地址错误，路由类不存在"];
    }
    
    // 构建实例
    NSObject *target = [[targetClass alloc] init];
    if (![target isKindOfClass:[UIViewController class]]) {
        return [self errorViewController:@"路由地址错误，路由类型不为UIViewController"];
    }
    
    SEL action = NSSelectorFromString(@"initWithParams:");
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action withObject:dictionary];
#pragma clang diagnostic pop
    }
    UIViewController *instanceVC = (UIViewController *)target;
    return instanceVC;
}

- (UIViewController *)errorViewController:(NSString *) vc{
    LXErrorViewController *errorVC = [[LXErrorViewController alloc] init];
    errorVC.message = vc;
    return errorVC;
}

@end
