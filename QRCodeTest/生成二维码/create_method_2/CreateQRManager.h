//
//  CreateQRManager.h
//  QRCodeTest
//
//  Created by 郑惠珠 on 2017/6/17.
//  Copyright © 2017年 Winnie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CreateQRManager : NSObject

/**
 *  展示二维码
 *  @param imageViewWidth 展示二维码的imageView的宽度
 *  @param dataStr   二维码的文字
 */
+ (UIImage *)showQRCodeWithImageWidth:(CGFloat)imageViewWidth andDataStr:(NSString *)dataStr;
/**
 *  展示带logo 的二维码
 *
 *  @param logoImageName logo 的名称
 *  @param dataStr   二维码的文字
 *  @param logoScaleToSuperView    logo相对于父视图的缩放比（取值范围：0-1，0，代表不显示，1，代表与父视图大小相同）
 */
+  (UIImage *)showQRCodeWithDataStr:(NSString *)dataStr andLogo:(NSString *)logoImageName logoScaleToSuperView:(CGFloat)logoScaleToSuperView;

/**
 *  生成一张彩色的二维码
 *
 *  @param data_Str    传入你要生成二维码的数据
 *  @param backgroundColor    背景色
 *  @param mainColor    主颜色
 */
+ (UIImage *)showQRWithColorQRCodeData:(NSString *)data_Str backgroundColor:(CIColor *)backgroundColor mainColor:(CIColor *)mainColor;


+ (NSString *)touchQRImageGetStringWithImage:(UIImage *)image;
@end
