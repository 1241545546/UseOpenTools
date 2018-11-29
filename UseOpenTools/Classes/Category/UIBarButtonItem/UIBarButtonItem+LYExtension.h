//
//  UIBarButtonItem+LYExtension.h
//  Project
//
//  Created by xiong on 2017/6/26.
//  Copyright © 2017年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LYExtension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
