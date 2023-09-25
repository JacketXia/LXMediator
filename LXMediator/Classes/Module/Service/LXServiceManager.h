//
//  LXService.h
//  LXMediator
//
//  Created by JacketXia on 2023/2/10.
//

#import <Foundation/Foundation.h>

/// 获取协议实现
#define LXGetService(protocol) \
(id<protocol>)[LXServiceManager getServiceImpWithName:[NSString stringWithUTF8String:""#protocol""]]\

NS_ASSUME_NONNULL_BEGIN

@interface LXServiceManager : NSObject

/// 获取协议对象
+ (id)getServiceImpWithProtocol:(Protocol *)proto;

+ (id)getServiceImpWithName:(NSString *)protoName;

@end

NS_ASSUME_NONNULL_END
