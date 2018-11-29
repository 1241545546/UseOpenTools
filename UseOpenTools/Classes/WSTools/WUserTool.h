//
//  WUserTool.h
//  WOpenManger
//
//  Created by sawu on 2018/11/15.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef void(^WUserToolcallBack)(NSInteger idx);

@interface WUserTool : NSObject

/**
 系统分享面板的封装 @[NSSting,[UIImage new],NSURL]
 
 @param activitys 内容
 @param vc 莫泰弹出的
 */
void SystemShareMessageManger(NSArray* _Nonnull activitys,__weak id _Nullable vc);

/**
 自定义快捷系统提示
 
 @param tips 提示内容 不能为空
 @param title 标题 默认为 提示
 @param others 按钮 默认为 OK
 @param callback 按钮点击回掉
 */
void SystemAlterViewShowWithTips(NSString* _Nonnull tips,NSString* _Nullable title,NSArray* _Nullable others,WUserToolcallBack _Nullable callback);


//根据给定的颜色渲染一张图片
UIImage * _Nullable UIImageWithColor(UIColor* _Nonnull color,CGSize size);
/**
 根据给定的字符串创建二维码图片
 @param scanstr 内容
 @return 返还的图片
 */
UIImage * _Nullable UIImageGetScanImageWithString(NSString* _Nullable scanstr,CGFloat size);

/**
 启动定时器 DISPATCH
 @param srcStr 字符串地址引用
 */
void DisPatchSourceTimer(NSString*_Nullable* _Nullable srcStr,CGFloat continueTime);

/**
 获取JSON文件的键值对
 @param key 键
 @param jsonName 文件名
 @return id
 */
id JsonGetObjectByKey(NSString* key,NSString* jsonName);

/**
 获取PLIST文件的键值对
 @param key 键
 @param plistName 文件名
 @return id
 */
id PlistGetObjectByKey(NSString* key,NSString* plistName);

/**
 根据给定的字符串、字体大小、高度获取长度
 
 @param font 字体大小
 @param height 高度
 @param src 字符串
 @return CGSize
 */
CGSize NSStringGetWidth(CGFloat font,CGFloat height,NSString* src);

/**
 根据给定的字符串、字体大小、宽度获取高度
 
 @param font 字体大小
 @param width 宽度
 @param src 字符串
 @return CGSize
 */
CGSize NSStringGetHeight(CGFloat font,CGFloat width,NSString* src);

/**
 根据谓词进行字筛选判断
 
 @param format_x 格式化字符串1
 @param format_y 格式化字符串2
 @param srcSTR 需要判断的字符串
 @return 判断结果
 */
BOOL NSStringPredicateFind(NSString* format_x,NSString* format_y,NSString* srcSTR);

/**
 根据给定的RGB值创建UIColor对象 不需要/255
 
 @param R red
 @param G green
 @param B blue
 @param alpha alpha
 @return UIColor*
 */
UIColor* UIColorWithARGB(CGFloat R,CGFloat G,CGFloat B,CGFloat alpha);

/**
 根据给定的RGB值创建UIColor对象 不需要/255
 
 @param R red
 @param G green
 @param B blue
 @return UIColor*
 */
UIColor* UIColorWithRGB(CGFloat R,CGFloat G,CGFloat B);

/**
 通过16进制值创建UIColor对象
 
 @param value 16进制数
 @param alpha 通道
 @return UIColor*
 */
UIColor* UIColorWithHEX(long value,CGFloat alpha);

/**
 通过16进制字符串创建UIColor对象
 
 @param hexSTR 16进制字符串
 @param alpha 透明通道
 @return UIColor*
 */
UIColor* UIColorWithHEXSTR(NSString* hexSTR,CGFloat alpha);

/**
 根据大小
 
 @param size 大小
 @return UIFont*
 */
UIFont* UIFontWithSize(CGFloat size);

/**
 根据大小和假粗
 
 @param size 大小
 @param weight 加加粗
 @return UIFont*
 */
UIFont* UIFontWithSizeWeight(CGFloat size,CGFloat weight);

/** 配置自定义字体需要配置PLIST文件以及字体源文件
 根据大小名称返回字体对象
 @param size 字体大小
 @param familyName 字体
 @return UIFont*
 */
UIFont* UIFontWithSizeFamily(CGFloat size,NSString* familyName);

@end
