//
//  LXRouter.h
//  LXLib
//
//  Created by JacketXia on 2023/1/3.
//

#import <UIKit/UIKit.h>
#import "LXControllerDelegate.h"
#import "LXAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface LXRouter : NSObject

//+ (LXRouter * (^)(NSString *_Nonnull name))onName;
//
//+ (LXRouter * (^)(UIViewController *_Nonnull vc))onVC;
//
//- (LXRouter * (^)(NSDictionary *_Nonnull param))onParam;
//
//- (void(^)(BOOL animated))onPush;
//
//- (void(^)(BOOL animated,void (^ _Nullable completion)(void)))onPresent;
//
//- (void(^)(BOOL animated))onReplace;
//
//+ (void(^)(BOOL animated))onPop;
//
//+ (void(^)(BOOL animated))onPopRoot;
//
//+ (void(^)(NSString *_Nonnull tag, BOOL animated))onPopTag;
//
//+ (void(^)(BOOL animated,void (^ _Nullable completion)(void)))onDismiss;

@end

NS_ASSUME_NONNULL_END
