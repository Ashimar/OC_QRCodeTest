//
//  CreateQRManager.m
//  QRCodeTest
//
//  Created by 郑惠珠 on 2017/6/17.
//  Copyright © 2017年 Winnie. All rights reserved.
//

#import "CreateQRManager.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
@implementation CreateQRManager

/**
 *  展示二维码
 *  @param imageViewWidth 展示二维码的imageView的宽度
 *  @param dataStr   二维码的文字
 */
+ (UIImage *)showQRCodeWithImageWidth:(CGFloat)imageViewWidth andDataStr:(NSString *)dataStr{
    // 借助UIImageView 来显示二维码
    // 1.创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认
    [filter setDefaults];
    // 3.给过滤器添加数据(正则表达式/账号和密码)

    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    // 4.获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    
    // 5.将CIImage转换成UIImage，并放大显示
    return [CreateQRManager createNonInterpolatedUIImageFormCIImage:outputImage withSize:imageViewWidth];
}
/**
 *  展示带logo 的二维码
 *
 *  @param logoImageName logo 的名称
 *  @param dataStr   二维码的文字
 *  @param logoScaleToSuperView    logo相对于父视图的缩放比（取值范围：0-1，0，代表不显示，1，代表与父视图大小相同）
 */
+  (UIImage *)showQRCodeWithDataStr:(NSString *)dataStr andLogo:(NSString *)logoImageName logoScaleToSuperView:(CGFloat)logoScaleToSuperView {
 
    // 1、创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2. 恢复默认
    [filter setDefaults];
    // 3. 给过滤器添加数据
    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    // 4. 获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    // 5. 图片小于（27，27），我们需要放大他
    outputImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
   // 6.将CIImage 类型转成UIImage 类型
    UIImage *start_image = [UIImage imageWithCIImage:outputImage];
    
    // ===============  添加中间小图标 ===============
    // 7.开启绘图，获取图形上下文，上下文就是二维码大小
    UIGraphicsBeginImageContext(start_image.size);
    // 8.把二维码画上去（这里以图片上下文，左上角（0，0）点
    [start_image drawInRect:CGRectMake(0, 0, start_image.size.width, start_image.size.height)];
    // 9. 把小图片绘制上去
    // 再把小图片画上去
    NSString *icon_imageName = logoImageName;
    UIImage *icon_image = [UIImage imageNamed:icon_imageName];
    CGFloat icon_imageW = start_image.size.width * logoScaleToSuperView;
    CGFloat icon_imageH = start_image.size.height * logoScaleToSuperView;
    CGFloat icon_imageX = (start_image.size.width - icon_imageW) * 0.5;
    CGFloat icon_imageY = (start_image.size.height - icon_imageH) * 0.5;
    
    [icon_image drawInRect:CGRectMake(icon_imageX, icon_imageY, icon_imageW, icon_imageH)];
    
    // 6、获取当前画得的这张图片
    UIImage *final_image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 7、关闭图形上下文
    UIGraphicsEndImageContext();
    
    return final_image;
    
}

/**
 *  生成一张彩色的二维码
 *
 *  @param data_Str    传入你要生成二维码的数据
 *  @param backgroundColor    背景色
 *  @param mainColor    主颜色
 */
+ (UIImage *)showQRWithColorQRCodeData:(NSString *)data_Str backgroundColor:(CIColor *)backgroundColor mainColor:(CIColor *)mainColor {
    // 1、创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 2、设置数据
    // 将字符串转换成 NSdata (虽然二维码本质上是字符串, 但是这里需要转换, 不转换就崩溃)
    NSData *qrImageData = [data_Str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 设置过滤器的输入值, KVC赋值
    [filter setValue:qrImageData forKey:@"inputMessage"];
    
    // 3、获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 图片小于(27,27),我们需要放大
    outputImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    
    // 4、创建彩色过滤器(彩色的用的不多)
    CIFilter * color_filter = [CIFilter filterWithName:@"CIFalseColor"];
    
    // 设置默认值
    [color_filter setDefaults];
    
    // 5、KVC 给私有属性赋值
    [color_filter setValue:outputImage forKey:@"inputImage"];
    
    // 6、需要使用 CIColor
    [color_filter setValue:backgroundColor forKey:@"inputColor0"];
    [color_filter setValue:mainColor forKey:@"inputColor1"];
    
    // 7、设置输出
    CIImage *colorImage = [color_filter outputImage];
    
    return [UIImage imageWithCIImage:colorImage];
}
/**
 * 根据CIImage生成指定大小的UIImage
 *
 * @param image CIImage
 * @param size 图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+ (NSString *)touchQRImageGetStringWithImage:(UIImage *)image {
    // CIDetector(CIDetector可用于人脸识别)进行图片解析，从而使我们可以便捷的从相册中获取到二维码
    // 声明一个CIDetector，并设定识别类型 CIDetectorTypeQRCode
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
    
    // 取得识别结果
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    NSString *scannedResult;
    for (int index = 0; index < [features count]; index ++) {
        CIQRCodeFeature *feature = [features objectAtIndex:index];
        scannedResult = feature.messageString;
        NSLog(@"scannedResult - - %@", scannedResult);
        // 在此发通知，告诉子类二维码数据
//        [SGQRCodeNotificationCenter postNotificationName:SGQRCodeInformationFromeAibum object:scannedResult];
    }
    return scannedResult;
}


@end
