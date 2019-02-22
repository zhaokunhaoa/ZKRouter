//
//  ViewController.m
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import "ViewController.h"
#import "ZKRouter.h"
#import "ZKRouter-PublicProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)clickButton:(UIButton *)sender {
    
    NSString *urlStr = @"Scheme://ModuleDetail/detailVC?vcTitle=(test)";
    NSURL *url = [NSURL URLWithString:urlStr];
    id<ModuleVCProtocol> vc = [[ZKRouter shareInstance] interfaceForURL:url];
    vc.interface.callbackBlock = ^(id parameter) {
        NSLog(@"%@", parameter);
    };
    [self.navigationController pushViewController:vc animated:true];
    
}

- (IBAction)clickButton2:(UIButton *)sender {
    
    id<ModuleDetail> module = [[ZKRouter shareInstance] interfaceForProtocol:@protocol(ModuleDetail)];
    [self.navigationController pushViewController:module.detailVC animated:true];

    
}


@end
