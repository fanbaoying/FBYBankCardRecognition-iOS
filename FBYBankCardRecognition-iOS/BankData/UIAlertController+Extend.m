//
//  UIAlertController+Extend.m
//  IDCardRecognition
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//


#import "UIAlertController+Extend.h"

@implementation UIAlertController (Extend)

+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction {
    UIAlertController *alertC = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    // 两个action（"确定"、“取消”）依添加顺序从左至右排列
    if (cancelAction) {
        [alertC addAction:cancelAction];
    }
    
    if (okAction) {
        [alertC addAction:okAction];
    }
    
    return alertC;
}

+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert okAction:okAction cancelAction:cancelAction];
}

+(instancetype)actionSheetControllerWithTitle:(NSString *)title message:(NSString *)message okAction:(UIAlertAction *)okAction cancelAction:(UIAlertAction *)cancelAction {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet okAction:okAction cancelAction:cancelAction];
}

@end
