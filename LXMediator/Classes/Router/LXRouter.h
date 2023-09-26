//
//  LXRouter.h
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXRouter : NSObject

+ (LXRouter * (^)(NSString *_Nonnull name,NSDictionary * _Nullable params))onName;

+ (LXRouter * (^)(UIViewController *_Nonnull vc))onVC;

- (void(^)(BOOL animated))onPush;

- (void(^)(BOOL animated,void (^ _Nullable completion)(void)))onPresent;

- (void(^)(BOOL animated))onReplace;

@end

NS_ASSUME_NONNULL_END
