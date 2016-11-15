//
//  UIViewController+Addition.h
//  InterceptorDemo
//
//  Created by deng on 16/11/15.
//  Copyright © 2016年 dengyonghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Addition)

// 拦截器是否有效
@property(nonatomic, assign) BOOL disabledInterceptor;
@property(nonatomic, assign) BOOL isInitTheme;

@end
