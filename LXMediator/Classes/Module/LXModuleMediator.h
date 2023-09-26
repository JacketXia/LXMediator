//
//  LXModule.h
//  LXMediator
//
//  Created by JacketXia on 2022/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXModuleMediator : NSObject

+ (instancetype)shared;

/**
 通过名字注册
 */
- (void)registerClass:(Class)cls WithName:(NSString *)name;

/**
 通过协议注册
 */
- (void)registerClass:(Class)cls WithProtocol:(Protocol *)proto;

/**
 通过名字获取类型
 */
- (Class)getClassWithName:(NSString *)name;

/**
 通过协议获取
 */
- (Class)getClassWithProtocol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
