//
//  Target_Route.h
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_Router : NSObject

- (UIViewController *)Action_GetViewController:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
