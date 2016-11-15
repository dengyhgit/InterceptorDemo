//
//  FirstViewController.m
//  InterceptorDemo
//
//  Created by deng on 16/11/15.
//  Copyright © 2016年 dengyonghao. All rights reserved.
//

#import "FirstViewController.h"
#import "OtherViewController.h"
#import "UIViewController+Addition.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"original viewWillAppear:");
}

- (IBAction)OtherView:(id)sender {
    OtherViewController *vc = [[OtherViewController alloc] init];
    vc.disabledInterceptor = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
