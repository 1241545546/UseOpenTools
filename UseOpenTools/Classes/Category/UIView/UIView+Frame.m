//
//  UIView+Frame.m
//  budejie
//
//  Created by xiong on 2016/9/26.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/* 控件高度 */
- (void)setLY_height:(CGFloat)LY_height {
    
    CGRect rect = self.frame;
    rect.size.height = LY_height;
    self.frame = rect;
}
- (CGFloat)LY_height {
    
    return self.frame.size.height;
}
/* 控件宽度 */
- (void)setLY_width:(CGFloat)LY_width {
    
    CGRect rect = self.frame;
    rect.size.width = LY_width;
    self.frame = rect;
}
- (CGFloat)LY_width {
    
    return self.frame.size.width;
}
/* 控件X */
- (void)setLY_x:(CGFloat)LY_x {
    
    CGRect rect = self.frame;
    rect.origin.x = LY_x;
    self.frame = rect;
}
- (CGFloat)LY_x {
    
    return self.frame.origin.x;
}
/* 控件Y */
- (void)setLY_y:(CGFloat)LY_y {
    
    CGRect rect = self.frame;
    rect.origin.y = LY_y;
    self.frame = rect;
}
- (CGFloat)LY_y {
    
    return self.frame.origin.y;
}
/* 控件中心X */
- (void)setLY_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)LY_centerX
{
    return self.center.x;
}
/* 控件中心Y */
- (void)setLY_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)LY_centerY
{
    return self.center.y;
}
/* 控件size */
- (void)setLY_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)LY_size
{
    return self.frame.size;
}
/** 控件最右所在X */
- (CGFloat)LY_right {
    
    return CGRectGetMaxX(self.frame);
}
- (void)setLY_right:(CGFloat)LY_right {
    
    self.LY_x = LY_right - self.LY_width;
}
/** 控件最下所在Y */
- (CGFloat)LY_bottom {
    
    return CGRectGetMaxY(self.frame);
}
- (void)setLY_bottom:(CGFloat)LY_bottom {
    
    self.LY_y = LY_bottom - self.LY_height;
}



@end
