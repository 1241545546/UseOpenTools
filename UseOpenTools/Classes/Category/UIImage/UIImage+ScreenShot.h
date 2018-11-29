//
//  UIImage+ScreenShot.h
//  Project
//
//  Created by 熊凤伟 on 2018/1/17.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScreenShot)

/**
 *  @brief  截图指定view成图片
 *
 *  @param view 一个view
 *
 *  @return 图片
 */
+ (UIImage *)LY_captureWithView:(UIView *)view;

+ (UIImage *)LY_getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;

/**
 *  @author Jakey
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param aView    指定的view
 *  @param maxWidth 宽的大小 0为view默认大小
 *
 *  @return 截图
 */
+ (UIImage *)LY_screenshotWithView:(UIView *)aView limitWidth:(CGFloat)maxWidth;

@end
