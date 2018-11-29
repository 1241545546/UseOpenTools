//
//  NSString+LYExtension.h
//  Project
//
//  Created by Shao Wei Su on 2017/6/30.
//  Copyright © 2017年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYExtension)

- (unsigned long long)fileSize;
/**
 判断字符串是否为空
 
 @param string 字符串
 @return 返回结果
 */
+ (BOOL)stringIsEmptyWithString:(NSString *)string;
/**
 修改字符串中字符大小和颜色
 
 @param OriginalString 原始字符串
 @param changeStrings 修改的字符串数组
 @param changeFonts 修改的字体数组
 @param changeColors 修改的颜色数组
 @return 返回修改后的字符串
 */
+ (NSMutableAttributedString *)stringChangeWithOriginalString:(NSString *)OriginalString changeStrings:(NSArray *)changeStrings changeFonts:(NSArray *)changeFonts changeColors:(NSArray *)changeColors;

@end
