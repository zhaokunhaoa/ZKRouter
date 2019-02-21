//
//  DetailViewController.h
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKRouter-PublicProtocol.h"

@class ModuleDetail;

@interface DetailViewController : UIViewController <ModuleVCProtocol>
/// 外部接口
@property(nonatomic, strong) ModuleDetail *interface;

@property (nonatomic, copy) NSString *vcTitle;

@end
