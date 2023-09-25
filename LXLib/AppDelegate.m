//
//  AppDelegate.m
//  LXLib
//
//  Created by JacketXia on 2022/12/23.
//

#import "AppDelegate.h"
#import <LXMediator/LXMediator.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [LXControllerManager registerRedirectName:@"/first" handle:^UIViewController * _Nonnull(NSString * _Nonnull name, NSDictionary * _Nullable params) {
//        return  LXGetController(@"/section", params);
        return nil;
    }];
//
//    [LXControllerManager registerRedirectName:@"/section" handle:^UIViewController * _Nonnull(NSString * _Nonnull name, NSDictionary * _Nullable params) {
//        return  LXGetController(@"/home", params);
//    }];
//    
//    [LXControllerManager registerNotFound:^UIViewController * _Nonnull(NSString * _Nonnull name, NSDictionary * _Nullable params) {
//        return  LXGetController(@"/replace", params);
//    }];
    
    return YES;
}


@end
