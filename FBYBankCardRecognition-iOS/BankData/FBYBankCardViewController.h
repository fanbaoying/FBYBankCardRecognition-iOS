//
//  FBYBankCardViewController.h
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

//#import <UIKit/UIKit.h>

#import "FBYBaseViewController.h"

#import "FBYScanBankCard.h"

#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
@interface FBYBankCardViewController : FBYBaseViewController

@property (nonatomic, strong)FBYScanBankCard *cameraManager;

@end
