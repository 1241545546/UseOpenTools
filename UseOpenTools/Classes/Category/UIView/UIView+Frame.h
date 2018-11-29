//
//  UIView+Frame.h
//  budejie
//
//  Created by xiong on 2016/9/26.
//  Copyright © 2016年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/* 控件宽度 */
@property CGFloat LY_width;
/* 控件高度 */
@property CGFloat LY_height;
/* 控件X */
@property CGFloat LY_x;
/* 控件Y */
@property CGFloat LY_y;
/* 控件中心X */
@property CGFloat LY_centerX;
/* 控件中心Y */
@property CGFloat LY_centerY;
/* 控件size */
@property CGSize  LY_size;
/** 控件最右所在X */
@property (nonatomic, assign) CGFloat LY_right;
/** 控件最下所在Y */
@property (nonatomic, assign) CGFloat LY_bottom;


@end
