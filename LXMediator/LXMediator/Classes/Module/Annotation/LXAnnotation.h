//
//  LXAnnotation.h
//  LXLib
//
//  Created by JacketXia on 2022/12/23.
//

#import <Foundation/Foundation.h>

#ifndef _LXIMPCONT
#define _LXIMPCONT "_LXIMPCONT"
#endif

#ifndef _LXIMPSERVICE
#define _LXIMPSERVICE "_LXIMPSERVICE"
#endif

#ifndef _Annotation
#define _Annotation

// 连接操作符
#define _LXCONCAT_(x,y,z,k) x##y##z##k
#define _LXCONCAT(x,y,z,k) _LXCONCAT_(x,y,z,k)

// 编译时将数据存入__DATA的#sectname中
#define _LXDATA(sectname) __attribute((used, section("__DATA,"#sectname"")))

// 控制器注册
#define LXController(name,cls) \
@class cls; \
char const * _LXCONCAT(LXRouter,cls,__LINE__,End) _LXDATA(_LXIMPCONT) =  "{ \""name"\" : \""#cls"\"}";

// 协议注册
#define LXService(proto,cls) \
@protocol proto; \
@class cls; \
char const * _LXCONCAT(LXService,proto,cls,End) _LXDATA(_LXIMPSERVICE) =  "{ \""#proto"\" : \""#cls"\"}";

#endif

NS_ASSUME_NONNULL_BEGIN

@interface LXAnnotation : NSObject

@end

NS_ASSUME_NONNULL_END
