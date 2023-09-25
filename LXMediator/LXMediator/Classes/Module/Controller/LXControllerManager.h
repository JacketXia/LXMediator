//
//  LXController.h
//  LXLib
//
//  Created by JacketXia on 2022/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIViewController *_Nullable(^LXControllerRedirectHandle)(NSString * _Nonnull name,NSDictionary  *_Nullable params);

typedef UIViewController *_Nonnull(^LXControllerNotFoundHandle)(NSString * _Nonnull name,NSDictionary  *_Nullable params);

@interface LXControllerManager : NSObject

/// @brief 重定向控制器
/// @param name 名字
/// @param handle 返回重定向后控制器，如果返回nil，则不进行重定向
+ (void)registerRedirectName:(NSString * _Nonnull)name handle:(nonnull LXControllerRedirectHandle)handle;

/// @brief 404控制器
+ (void)registerNotFound:(nonnull LXControllerNotFoundHandle)handle;

@end

/// 获取控制器
UIViewController* LXGetController(NSString * _Nonnull name, NSDictionary * _Nullable params);


NS_ASSUME_NONNULL_END
