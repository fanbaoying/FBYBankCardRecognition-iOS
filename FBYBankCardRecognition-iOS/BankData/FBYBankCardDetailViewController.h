//
//  FBYBankCardDetailViewController.h
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBYBankCardModel;

@interface FBYBankCardDetailViewController : UIViewController
// 银行卡信息
@property (nonatomic,strong) FBYBankCardModel *FBYBankCardModel;

@end
