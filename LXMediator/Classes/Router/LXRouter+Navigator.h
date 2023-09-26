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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

- (void)replaceViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

