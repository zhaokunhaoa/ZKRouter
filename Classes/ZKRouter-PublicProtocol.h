//
//  ZKRouter-PublicProtocol.h
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#ifndef ZKRouter_PublicProtocol_h
#define ZKRouter_PublicProtocol_h

@class UIViewController;
typedef void(^ModuleCallBackBlock)(id parameter);


/// 基础模块协议
@protocol ModuleProtocol <NSObject>

/// 暴露给组件外部的控制器，一般为该组件的主控制器
@property (nonatomic, weak) UIViewController *interfaceViewController;

/// 回调
@property (nonatomic, copy) ModuleCallBackBlock callbackBlock;

@end

@protocol ModuleVCProtocol <NSObject>
@property(nonatomic, strong) id<ModuleProtocol> interface;
@end




//// ModuleA
@protocol ModuleDetail <ModuleProtocol>

@property (nonatomic, weak) UIViewController *detailVC;

@end












#endif /* ZKRouter_PublicProtocol_h */
