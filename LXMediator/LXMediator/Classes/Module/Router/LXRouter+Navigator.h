//
//  LXRouter.h
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import "LXRouter.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXRouter (Navigator)

/**
 @brief 获取当前显示的控制器
 */
+ (UIViewController * _Nullable)topViewController;

@end

NS_ASSUME_NONNULL_END

