//
//  UIImage+Extend.h
//  BankCard
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImage (Extend)

+ (UIImage *)getImageStream:(CVImageBufferRef)imageBuffer;
+ (UIImage *)getSubImage:(CGRect)rect inImage:(UIImage*)image;

@end
