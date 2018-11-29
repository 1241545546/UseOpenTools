//
//  WUserTool.m
//  WOpenManger
//
//  Created by sawu on 2018/11/15.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "WUserTool.h"

#import <objc/runtime.h>

#import "ReactiveObjC.h"

@interface WUserTool()

@end

@implementation WUserTool

void SystemShareMessageManger(NSArray* activitys,__weak id vc){
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activitys applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    if (!vc) {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:activityVC animated:YES completion:nil];
    }else{
        [vc presentViewController:activityVC animated:YES completion:nil];
    }
    // 分享之后的回调
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (completed) {
            
        } else  {
            
        }
    };
    
    //    SLComposeServiceViewController* service=[[SLComposeServiceViewController alloc]init];
    //    SLComposeSheetConfigurationItem* item1=[[SLComposeSheetConfigurationItem alloc]init];
    //    item1.title=@"微信";
    //    item1.tapHandler = ^{
    //        NSLog(@"++");
    //    };
    //    service.configurationItems=@[item1];
    //    SLComposeSheetConfigurationItem
    
    //    SLComposeViewController *svc = [SLComposeViewController composeViewControllerForServiceType:@"com.tencent.xin.sharetimeline"];
    //    svc.view.frame=CGRectMake(12, 100, WS_SCREENWIDTH-24, ScreenHeight);
    //
    //    SLComposeViewControllerCompletionHandler myblock = ^(SLComposeViewControllerResult result){
    //        if(result == SLComposeViewControllerResultCancelled){
    //            NSLog(@"取消分享");
    //
    //        }else{
    //            NSLog(@"分享成功");
    //        }
    //        [svc dismissViewControllerAnimated:YES completion:nil];
    //    };
    //    [svc addImage:[UIImage imageNamed:@"gathering_zhifubao_on"]];
    //    [svc addImage:[UIImage imageNamed:@"icon_all_logo_qq"]];
    //    [svc addURL:[NSURL URLWithString:@"www.baidu.com"]];
    //    [svc addURL:[NSURL URLWithString:@"www.baidu.com"]];
    //    svc.completionHandler = myblock;
    //    [vc presentViewController:svc animated:YES completion:nil];
}

void SystemAlterViewShowWithTips(NSString* _Nonnull tips,NSString* _Nullable title,NSArray* _Nullable others,WUserToolcallBack _Nullable callback){
    if (!title) {
        title=@"提示";
    }
    UIAlertController* alter=[UIAlertController alertControllerWithTitle:title message:tips preferredStyle:UIAlertControllerStyleAlert];
    if (!others) {
        UIAlertAction* aciton=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (callback) {
                callback(0);
            }
        }];
        [alter addAction:aciton];
    }else{
        int a = 0;
        for (NSString* item in others) {
            UIAlertAction* aciton=[UIAlertAction actionWithTitle:item style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (callback) {
                    callback(a);
                }
            }];
            a++;
            [alter addAction:aciton];
        }
    }
    if (![UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController) {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alter animated:YES completion:nil];
    }else{
        [[UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController presentViewController:alter animated:YES completion:nil];
    }
}

UIImage * UIImageWithColor(UIColor* color,CGSize size)
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

UIImage * UIImageGetScanImageWithString(NSString* scanstr,CGFloat size){
    
    CIFilter* filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    NSData* data = [scanstr dataUsingEncoding: NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage* ciimage=filter.outputImage;
    
    //对CIQRCodeGenerator 生成的CIImage对象进行不插值放大或缩小处理
    CGRect extent = ciimage.extent;
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    size_t with = scale * CGRectGetWidth(extent);
    size_t height = scale * CGRectGetHeight(extent);
    
    UIGraphicsBeginImageContext(CGSizeMake(with, height));
    CGContextRef bitmapContextRef = UIGraphicsGetCurrentContext();
    
    CIContext *context = [CIContext contextWithOptions:nil];
    //通过CIContext 将CIImage生成CGImageRef
    CGImageRef bitmapImage = [context createCGImage:ciimage fromRect:extent];
    //在对二维码放大或缩小处理时,禁止插值
    CGContextSetInterpolationQuality(bitmapContextRef, kCGInterpolationNone);
    //对二维码进行缩放
    CGContextScaleCTM(bitmapContextRef, scale, scale);
    //将二维码绘制到图片上下文
    CGContextDrawImage(bitmapContextRef, extent, bitmapImage);
    //获得上下文中二维码
    UIImage *retVal =  UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(bitmapImage);
    CGContextRelease(bitmapContextRef);
    return retVal;
    
    //    CGImageRef cgimage= [context createCGImage:ciimage fromRect:CGRectMake(0, 0, 500, 500)];
    //    return [UIImage imageWithCGImage:cgimage];
}

void DisPatchSourceTimer(NSString* __autoreleasing * srcStr,CGFloat continueTime){
    
    __block NSInteger second = continueTime;
    // 全局队列 默认优先级
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 定时器模式 事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // NSEC_PER_SEC是秒 *1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (second >= 0) {
                *srcStr=[NSString stringWithFormat:@"(%ldS)后重发", second];
                second--;
            }else {
                dispatch_source_cancel(timer);
                *srcStr=@"重新发送";
            }
            
        });
    });
    // 启动源
    dispatch_resume(timer);
}

id JsonGetObjectByKey(NSString* key,NSString* jsonName){
    
    NSString* path = [[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"];
    NSData* data=[NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil][key];
}

id PlistGetObjectByKey(NSString* key,NSString* plistName){
    NSString* path = [[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"];
    NSDictionary* plistdic =[NSDictionary dictionaryWithContentsOfFile:path];
    return plistdic[key];
}

CGSize NSStringGetWidth(CGFloat font,CGFloat height,NSString* src){
    return [src boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

CGSize NSStringGetHeight(CGFloat font,CGFloat width,NSString* src){
    return [src boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

BOOL NSStringPredicateFind(NSString* format_x,NSString* format_y,NSString* srcSTR){
    //@"SELF MATCHES %@", @"1[34578]([0-9]){9}" 判断手机号
    NSPredicate* phoneTest = [NSPredicate predicateWithFormat:format_x, format_y];
    return [phoneTest evaluateWithObject:srcSTR];
    
}

UIColor* UIColorWithRGB(CGFloat R,CGFloat G,CGFloat B){
    
    return [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1.f];
}

UIColor* UIColorWithARGB(CGFloat R,CGFloat G,CGFloat B,CGFloat alpha){
    return [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:alpha];
}

UIColor* UIColorWithHEX(long value,CGFloat alpha){
    
    float red = (float)((value & 0xFF0000) >> 16);
    float green = (float)((value & 0xFF00) >> 8);
    float blue = (float)(value & 0xFF);
    return UIColorWithARGB(red, green, blue, alpha);
}

UIColor* UIColorWithHEXSTR(NSString* hashSTR,CGFloat alpha){
    
    NSString *removeSharpMarkhexString = [hashSTR stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:removeSharpMarkhexString];
    unsigned result = 0;
    [scanner scanHexInt:&result];
    return UIColorWithHEX(result, alpha);
}

UIFont* UIFontWithSize(CGFloat size){
    return [UIFont systemFontOfSize:size];
}
UIFont* UIFontWithSizeWeight(CGFloat size,CGFloat weight){
    return [UIFont systemFontOfSize:size weight:size];
}
UIFont* UIFontWithSizeFamily(CGFloat size,NSString* familyName){
    return [UIFont fontWithName:familyName size:size];
}

@end
