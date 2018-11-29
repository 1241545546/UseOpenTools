//
//  NSString+LYExtension.m
//  Project
//
//  Created by Shao Wei Su on 2017/6/30.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "NSString+LYExtension.h"

@implementation NSString (LYExtension)

// 方法一

//- (unsigned long long)fileSize {
//    
//    // 总大小
//    unsigned long long size = 0;
//    
//    // 文件管理者
//    NSFileManager *mgr = [NSFileManager defaultManager];
//    
//    // 文件属性
//    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
//    
//    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) { // 文件夹
//        
//        // 获得文件夹大小 == 获得文件夹中所有文件的总大小
//        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
//        
//        for (NSString *subpath in enumerator) {
//            
//            // 全路径
//            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
//            
//            // 累加文件大小
//            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
//        }
//        
//    }else { // 文件
//        
//        size = attrs.fileSize;
//    }
//    
//    return size;
//}

// 方法二

- (unsigned long long)fileSize {
    
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!exists) return size;
    
    if (isDirectory) { // 文件夹
        
        // 获得文件夹大小 == 获得文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        
        for (NSString *subpath in enumerator) {
            
            // 全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
        
    }else { // 文件
        
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}
/**
 判断字符串是否为空
 
 @param string 字符串
 @return 返回结果
 */
+ (BOOL)stringIsEmptyWithString:(NSString *)string {
    if (string.length == 0 || [string isEqualToString:@""] || string == nil || string == NULL || [string isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}
/**
 修改字符串中字符大小和颜色

 @param OriginalString 原始字符串
 @param changeStrings 修改的字符串数组
 @param changeFonts 修改的字体数组
 @param changeColors 修改的颜色数组
 @return 返回修改后的字符串
 */
+ (NSMutableAttributedString *)stringChangeWithOriginalString:(NSString *)OriginalString changeStrings:(NSArray *)changeStrings changeFonts:(NSArray *)changeFonts changeColors:(NSArray *)changeColors {
    
    NSMutableAttributedString *attDescribeStr = [[NSMutableAttributedString alloc] initWithString:OriginalString];
    for (int i = 0; i < changeStrings.count; i++) {
        
        [attDescribeStr addAttribute:NSForegroundColorAttributeName value:changeColors[i] range:[OriginalString rangeOfString:changeStrings[i]]];
        [attDescribeStr addAttribute:NSFontAttributeName value:changeFonts[i] range:[OriginalString rangeOfString:changeStrings[i]]];
    }
    
    return attDescribeStr;
}


@end
