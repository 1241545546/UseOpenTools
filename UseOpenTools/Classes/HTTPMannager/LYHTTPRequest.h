//
//  LYHTTPRequest.h
//  JFB
//
//  Created by xiong on 2017/12/21.
//  Copyright © 2017年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 请求成功的block
 */
typedef void(^LYRequestSuccess)(id response);
/**
 请求失败的block
 */
typedef void(^LYRequestFailure)(NSError *error);

@interface LYHTTPRequest : NSObject

/** 公用请求方法 */
+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(LYRequestSuccess)success failure:(LYRequestFailure)failure isPOST:(BOOL)POST isCache:(BOOL)cache;
/** 上传单张/多张图片 */
+ (NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL parameters:(NSDictionary *)parameter keyName:(NSString *)name images:(NSArray *)images imagesName:(NSArray *)imagesNames imageScale:(CGFloat)imageScale imageType:(NSString *)imageType success:(LYRequestSuccess)success failure:(LYRequestFailure)failure;

@end
