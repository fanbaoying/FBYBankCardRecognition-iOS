//
//  FBYBaseViewController.h
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FBYBaseViewController : UIViewController
/**
 修改导航栏颜色
 
 @param backColor 导航颜色
 */
- (void)changeNaviBackColor:(UIColor *)backColor;

+ (void)presentVC:(UIViewController *)viewController;

- (void)tabBarItemClicked;

- (void)configSubViews;
@end
