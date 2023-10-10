//
//  LXStorage.h
//  LXMediator
//
//  Created by JacketXia on 2023/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIViewController *_Nullable(^LXControllerRedirectHandle)(NSString * _Nonnull name,NSDictionary  *_Nullable params);

typedef UIViewController *_Nonnull(^LXControllerNotFoundHandle)(NSString * _Nonnull name,NSDictionary  *_Nullable params);

typedef BOOL (^LXRouterInterceptorHandle)(NSString * _Nonnull name,NSDictionary  *_Nullable params);

@interface LXStorage : NSObject

+ (instancetype)shared;

/// 重定向控制器响应
@property (nonatomic, strong) NSMutableDictionary<NSString *,LXControllerRedirectHandle> *redirectNames;

/// 未找到路由响应
@property (nonatomic, copy) LXControllerRedirectHandle notFoundHandle;

/// 拦截路由响应
@property (nonatomic, strong) NSMutableDictionary<NSString *,LXRouterInterceptorHandle> *interceptorNames;

/// 注册window
@property (nonatomic, strong) UIWindow *keyWindow;

@end

NS_ASSUME_NONNULL_END
