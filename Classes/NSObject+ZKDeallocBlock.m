//
//  NSObject+ZKDeallocBlock.m
//  TestDealloc
//
//  Created by zhaokun on 2019/1/15.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import "NSObject+ZKDeallocBlock.h"
#import <objc/runtime.h>


@interface ZKDeallocHookObject : NSObject

@end

@implementation ZKDeallocHookObject {
    ZKDeallocBlock _deallocBlock;
}

- (instancetype)initWithDeallocBlock:(ZKDeallocBlock)block {
    if (self = [super init]) {
        _deallocBlock = [block copy];
    }
    return self;
}

- (void)dealloc {
    !_deallocBlock ?: _deallocBlock();
}

@end


@implementation NSObject (ZKDeallocBlock)

- (void)zk_deallocWithBlock:(ZKDeallocBlock)block {
    if (block) {
        ZKDeallocHookObject *obj = [[ZKDeallocHookObject alloc] initWithDeallocBlock:block];
        objc_setAssociatedObject(self, (__bridge const void *)(obj), obj, OBJC_ASSOCIATION_RETAIN);
    }
}

@end
