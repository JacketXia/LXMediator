//
//  XXRouter.m
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import "LXRouter.h"
#import "CTMediator+Router.h"

inline void LXRouterPush(NSString *_Nonnull route, NSDictionary *_Nullable params, BOOL animated) {
    [[CTMediator sharedInstance] pushRoute:route params:params animated:animated];
}

inline void LXRouterPresent(NSString *_Nonnull route, NSDictionary *_Nullable params, BOOL animated) {
    [[CTMediator sharedInstance] presentRoute:route params:params animated:animated completion:nil];
}

inline void LXRouterPresentCompletion(NSString *_Nonnull route, NSDictionary *_Nullable params, BOOL animated, void(^_Nullable completion)(void)) {
    [[CTMediator sharedInstance] presentRoute:route params:params animated:animated completion:completion];
}

inline void LXRouterGoBack(BOOL animated) {
    [[CTMediator sharedInstance] popAnimated:animated completion:nil];
}

inline void LXRouterGoBackCompletion(BOOL animated,void(^_Nullable completion)(void)) {
    [[CTMediator sharedInstance] popAnimated:animated completion:completion];
}
