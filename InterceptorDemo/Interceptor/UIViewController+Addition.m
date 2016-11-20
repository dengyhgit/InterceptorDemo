//
//  UIViewController+Addition.m
//  InterceptorDemo
//
//  Created by deng on 16/11/15.
//  Copyright © 2016年 dengyonghao. All rights reserved.
//

#import "UIViewController+Addition.h"
#import <objc/runtime.h>

#define KeyIsInitTheme @"KeyIsInitTheme"
#define KeyDisabledInterceptor @"KeyDisabledInterceptor"

@implementation UIViewController (Addition)

#pragma mark - inline property
- (BOOL)isInitTheme {
    return objc_getAssociatedObject(self, KeyIsInitTheme);
}

- (void)setIsInitTheme:(BOOL)isInitTheme {
    objc_setAssociatedObject(self, KeyIsInitTheme, @(isInitTheme), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)disabledInterceptor {
    return objc_getAssociatedObject(self, KeyDisabledInterceptor);
}

- (void)setDisabledInterceptor:(BOOL)disabledInterceptor {
    NSNumber *integer = @(disabledInterceptor);
    if (integer.intValue == 0) {
        objc_setAssociatedObject(self, KeyDisabledInterceptor, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        objc_setAssociatedObject(self, KeyDisabledInterceptor, integer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
                    

@end
