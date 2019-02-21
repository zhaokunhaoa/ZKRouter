//
//  ZKRouter.h
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKRouter : NSObject

+ (instancetype)shareInstance;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (id)interfaceForProtocol:(Protocol *)protocol;
- (id)interfaceForURL:(NSURL *)url;


@end

NS_ASSUME_NONNULL_END
