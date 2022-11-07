//
//  CTMediator+Route.h
//  RouteDemo
//
//  Created by xiawenbin on 2022/11/4.
//

#import <CTMediator/CTMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (Router)

- (void)pushRoute:(NSString *_Nonnull)route params:(NSDictionary *_Nullable)params animated:(BOOL)animated;

- (void)presentRoute:(NSString *_Nonnull)route params:(NSDictionary *_Nullable)params animated:(BOOL)animated completion:(void(^_Nullable)(void)) completion;

- (void)popAnimated:(BOOL)animated completion:(void(^_Nullable)(void)) completion;

@end

NS_ASSUME_NONNULL_END
