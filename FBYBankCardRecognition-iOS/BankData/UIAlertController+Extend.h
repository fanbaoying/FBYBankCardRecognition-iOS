//
//  UIAlertController+Extend.h
//  IDCardRecognition
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIAlertController (Extend)

// 创建AlertController
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction;

// 创建ActionSheetController
+(instancetype)actionSheetControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction;

@end
