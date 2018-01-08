//
//  FBYBankCardModel.h
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface FBYBankCardModel : NSObject
@property (nonatomic, copy) NSString *bankNumber;
@property (nonatomic, copy) NSString *bankName;
@property (nonatomic, strong) UIImage *bankImage;
@end
