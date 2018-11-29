//
//  UIImage+FileName.h
//  Project
//
//  Created by 熊凤伟 on 2018/1/18.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (File)

/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)LY_imageWithFileName:(NSString *)name;
/**
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)LY_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;
/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage*)LY_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;
/**
 *  @brief  修正图片的方向
 *
 *  @param srcImg 图片
 *
 *  @return 修正方向后的图片
 */
+ (UIImage *)LY_fixOrientation:(UIImage *)srcImg;
/**
 *  @brief  旋转图片
 *
 *  @param degrees 角度
 *
 *  @return 旋转后图片
 */
- (UIImage *)LY_imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  @brief  旋转图片
 *
 *  @param radians 弧度
 *
 *  @return 旋转后图片
 */
- (UIImage *)LY_imageRotatedByRadians:(CGFloat)radians;

/**
 *  @brief  垂直翻转
 *
 *  @return  翻转后的图片
 */
- (UIImage *)LY_flipVertical;
/**
 *  @brief  水平翻转
 *
 *  @return 翻转后的图片
 */
- (UIImage *)LY_flipHorizontal;

/**
 *  @brief  角度转弧度
 *
 *  @param degrees 角度
 *
 *  @return 弧度
 */
+ (CGFloat)LY_degreesToRadians:(CGFloat)degrees;
/**
 *  @brief  弧度转角度
 *
 *  @param radians 弧度
 *
 *  @return 角度
 */
+ (CGFloat)LY_radiansToDegrees:(CGFloat)radians;
/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)LY_compressImage:(UIImage *)image toMaxLength:(NSInteger) maxLength maxWidth:(NSInteger)maxWidth;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)LY_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;

/**
 *  通过指定图片最长边，获得等比例的图片size
 *
 *  @param image       原始图片
 *  @param imageLength 图片允许的最长宽度（高度）
 *
 *  @return 获得等比例的size
 */
+ (CGSize)LY_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength;


+ (UIImage*)LY_resizableHalfImage:(NSString *)name;

/**
 图片合成文字
 @param text            文字
 @param font            字体大小
 @param textColor       字体颜色
 @param textFrame       字体位置
 @param image           原始图片
 @param viewFrame       图片所在View的位置
 @return UIImage *
 */
+ (UIImage *)imageWithText:(NSString *)text
                  textFont:(UIFont *)font
                 textColor:(UIColor *)textColor
                 textFrame:(CGRect)textFrame
               originImage:(UIImage *)image
    imageLocationViewFrame:(CGRect)viewFrame;
/**
 旋转图片
 
 @param orientation 角度
 @param image 原始图片
 @return 旋转后的图片
 */
+ (UIImage *)imageWithrotation:(UIImageOrientation)orientation originalImage:(UIImage *)image;
/**
 *  return 合成后的图片 (以坐标为参考点，准确)
 *  @param mainImage        第一张图片位画布                          （必传，不可空）
 *  @param viewFrame        第一张图片所在View的frame（获取压缩比用）    （必传，不可空）
 *  @param imgArray         子图片数组                               （必传，不可空）
 *  @param frameArray       子图片坐标数组                            （必传，不可空）
 */
+ (UIImage *)imageComposeOnMainImage:(UIImage *)mainImage
                  mainImageViewFrame:(CGRect)viewFrame
                       subImageArray:(NSArray *)imgArray
                  subImageFrameArray:(NSArray *)frameArray;
/**
 获取灰色图片
 *  return 灰色图片
 *  @param imageName 图片名称
 */
+ (UIImage *)imageToGraryWithImageName:(NSString *)imageName;

/**
 获取灰色图片

 @param image 图片
 @return 返回灰色图片
 */
+ (UIImage *)imageToGraryWithImage:(UIImage *)image;

@end
