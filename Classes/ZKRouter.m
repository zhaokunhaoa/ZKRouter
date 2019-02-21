//
//  ZKRouter.m
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import "ZKRouter.h"
#import <objc/runtime.h>

@implementation ZKRouter

static ZKRouter * _instance;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}


#pragma mark - Interface
- (id)interfaceForProtocol:(Protocol *)protocol {
    Class class = [self classForProtocol:protocol];
    return [[class alloc] init];
}

- (id)interfaceForURL:(NSURL *)url {
    id result = [self interfaceForProtocol:objc_getProtocol(url.host.UTF8String)];
    
    if ([url.lastPathComponent length]) {
        id vc = [result valueForKey:url.lastPathComponent];
        NSURLComponents *cp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
        [cp.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([vc respondsToSelector:NSSelectorFromString(obj.name)]) {
                [vc setValue:obj.value forKey:obj.name];//KVC设置
            }
        }];
        
        return vc;
    }
    
    return [result valueForKey:@"interfaceViewController"];
}


#pragma mark - Private
- (Class)classForProtocol:(Protocol *)protocol {
    NSString *classString = NSStringFromProtocol(protocol);
    return NSClassFromString(classString);
}

@end
