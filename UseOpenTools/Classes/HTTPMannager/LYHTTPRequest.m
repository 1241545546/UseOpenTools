//
//  LYHTTPRequest.m
//  JFB
//
//  Created by xiong on 2017/12/21.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "LYHTTPRequest.h"
#import "LYNetworkHelper.h"

@implementation LYHTTPRequest

+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(LYRequestSuccess)success failure:(LYRequestFailure)failure isPOST:(BOOL)POST isCache:(BOOL)cache {
    
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    //    [LYNetWorkHelper setValue:LY_AppVersion forHTTPHeaderField:@"version"];
    [LYNetworkHelper setRequestTimeoutInterval:8.0];
    [LYNetworkHelper openNetworkActivityIndicator:YES];
    
    if (POST) { // POST
        if (cache) { // cash
            return [LYNetworkHelper POST:URL parameters:parameter responseCache:^(id responseCache) {
                // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                success(responseCache);
            } success:^(id responseObject) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                success(responseObject);
            } failure:^(NSError *error) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                failure(error);
            }];
        }else { // no cash
            return [LYNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                success(responseObject);
            } failure:^(NSError *error) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                failure(error);
            }];
        }
    }else { // GET
        if (cache) { // cash
            return [LYNetworkHelper GET:URL parameters:parameter responseCache:^(id responseCache) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                success(responseCache);
            } success:^(id responseObject) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                success(responseObject);
            } failure:^(NSError *error) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                failure(error);
            }];
        }else { // no cash
            [LYNetworkHelper GET:URL parameters:parameter success:^(id responseObject) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                success(responseObject);
            } failure:^(NSError *error) {
                [LYNetworkHelper openNetworkActivityIndicator:NO];
                failure(error);
            }];
        }
    }
    return nil;
}

+ (NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL parameters:(NSDictionary *)parameter keyName:(NSString *)name images:(NSArray *)images imagesName:(NSArray *)imagesNames imageScale:(CGFloat)imageScale imageType:(NSString *)imageType success:(LYRequestSuccess)success failure:(LYRequestFailure)failure {
    
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    //    [LYNetWorkHelper setValue:LY_AppVersion forHTTPHeaderField:@"version"];
    [LYNetworkHelper setRequestTimeoutInterval:8.0];
    [LYNetworkHelper openNetworkActivityIndicator:YES];
    
    return [LYNetworkHelper uploadImagesWithURL:URL parameters:parameter name:name images:images fileNames:imagesNames imageScale:imageScale imageType:imageType progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        [LYNetworkHelper openNetworkActivityIndicator:NO];
        success(responseObject);
    } failure:^(NSError *error) {
        [LYNetworkHelper openNetworkActivityIndicator:NO];
        failure(error);
    }];
}

@end
