//
//  XXRouter.h
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @brief 根据路由地址带参数push,参数可空
       需要接收参数的控制器需要实现 -(void)initWithParams:(NSDictionary *)params
       需要回调的页面,可以将回调block加在params里
 */
void LXRouterPush(NSString *_Nonnull route, NSDictionary *_Nullable params, BOOL animated);

/**
 @brief 根据路由地址带参数present,参数可空
       需要接收参数的控制器需要实现 -(void)initWithParams:(NSDictionary *)params
       需要回调的页面,可以将回调block加在params里
 */
void LXRouterPresent(NSString *_Nonnull route, NSDictionary *_Nullable params, BOOL animated);

/**
 @brief 根据路由地址带参数present,参数可空
       需要接收参数的控制器需要实现 -(void)initWithParams:(NSDictionary *)params
       需要回调的页面,可以将回调block加在params里
       完成时回调
 */
void LXRouterPresentCompletion(NSString *_Nonnull route, NSDictionary *_Nullable params, BOOL animated, void(^_Nullable completion)(void));

/**
 @brief 返回上级页面,如果是push进入的，采取pop，如果是present的，采取dismiss
 */
void LXRouterGoBack(BOOL animated);

/**
 @brief 返回上级页面,如果是push进入的，采取pop，如果是present的，采取dismiss，
        完成跳转的回调,pop时立马生效，present时，完成时回调
 */
void LXRouterGoBackCompletion(BOOL animated,void(^_Nullable completion)(void));

NS_ASSUME_NONNULL_END
