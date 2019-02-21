//
//  NSObject+ZKDeallocBlock.h
//  TestDealloc
//
//  Created by zhaokun on 2019/1/15.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZKDeallocBlock)(void);

@interface NSObject (ZKDeallocBlock)

- (void)zk_deallocWithBlock:(ZKDeallocBlock)block;

@end
