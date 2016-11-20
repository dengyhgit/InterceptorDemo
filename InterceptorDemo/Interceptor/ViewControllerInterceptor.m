//
//  ViewControllerInterceptor.m
//  InterceptorDemo
//
//  Created by deng on 16/11/15.
//  Copyright © 2016年 dengyonghao. All rights reserved.
//

#import "ViewControllerInterceptor.h"
#import "Aspects.h"
#import <UIKit/UIKit.h>
#import "UIViewController+Addition.h"


@implementation ViewControllerInterceptor

// 会在应用启动的时候自动被runtime调用，通过这个方法可以实现代码的注入
+ (void)load {
    [super load];
    [ViewControllerInterceptor sharedInstance];
}

// 单例
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ViewControllerInterceptor *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ViewControllerInterceptor alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if ([super init]) {
         // 使用 Aspects 进行方法的拦截
         // AspectOptions 三种方式选择：在原本方法前执行、在原本方法后执行、替换原本方法
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            UIViewController * vc = [aspectInfo instance];
            if (!vc.disabledInterceptor) {
                [self viewWillAppear:animated viewController:vc];
            }
        } error:NULL];
    }
    return self;
}

// 通过这种方式可以代替原来框架中的基类，不必每个 ViewController 再去继续原框架的基类
#pragma mark - fake methods
- (void)viewWillAppear:(BOOL)animated viewController:(UIViewController *)viewController
{
    // 去做基础业务相关的内容
    if (!viewController.isInitTheme) {
        [self ThemeDidNeedUpdateStyle];
        viewController.isInitTheme = YES;
    }
    // 其他操作......
}

- (void)ThemeDidNeedUpdateStyle {
    NSLog(@"Theme did need update style");
}

@end
