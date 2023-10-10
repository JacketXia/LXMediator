//
//  LXRouterParamDelegate.h
//  LXMediator
//
//  Created by JacketXia on 2022/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LXControllerDelegate <NSObject>

@optional
/// 实现这个方法可获取参数
- (void)lx_initializeParams:(nullable NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
