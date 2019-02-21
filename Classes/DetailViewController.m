//
//  DetailViewController.m
//  ZKRouterDemo
//
//  Created by zhaokun on 2019/2/21.
//  Copyright © 2019年 zhaokun. All rights reserved.
//

#import "DetailViewController.h"
#import "ModuleDetail.h"
#import "NSObject+ZKDeallocBlock.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.vcTitle;
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    
    [self zk_deallocWithBlock:^{
        NSLog(@"DetailViewController => dealloc");
    }];
}

- (void)backAction {
    if (self.interface.callbackBlock) {
        self.interface.callbackBlock(@"callBack paramter");
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
