//
//  UIBarButtonItem+LYExtension.m
//  Project
//
//  Created by xiong on 2017/6/26.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "UIBarButtonItem+LYExtension.h"

@implementation UIBarButtonItem (LYExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:highImage] forState:(UIControlStateHighlighted)];
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

@end
