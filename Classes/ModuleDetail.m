//
//  ModuleDetail.m
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import "ModuleDetail.h"
#import "DetailViewController.h"

@implementation ModuleDetail

@synthesize callbackBlock;
@synthesize detailVC;
@synthesize interfaceViewController;

- (UIViewController *)detailVC {
    DetailViewController *detailVC = [DetailViewController new];
    detailVC.interface = self;
    return detailVC;
}

- (UIViewController *)interfaceViewController {
    DetailViewController *detailVC = [DetailViewController new];
    detailVC.interface = self;
    return detailVC;
}


@end
