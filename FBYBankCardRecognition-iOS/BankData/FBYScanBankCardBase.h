//
//  FBYScanBankCardBase.h
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FBYDesign.h"
#import "BankCardSearch.h"
#import "UIImage+Extend.h"
#import "FBYBankCardModel.h"
#import "exbankcard.h"
#import "excards.h"


typedef enum : NSUInteger {
    BankScanType,
    IDScanType,
} kScanType;

@interface FBYScanBankCardBase : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, assign) BOOL                      verify;

@property (nonatomic, assign) kScanType scanType;

@property (nonatomic, strong) RACSubject *receiveSubject;
@property (nonatomic, strong) RACSubject *bankScanSuccess;
@property (nonatomic, strong) RACSubject *scanError;

@property (nonatomic, strong) AVCaptureSession *captureSession;

@property (nonatomic, copy) NSString *sessionPreset; // 图片质量

@property (nonatomic, assign) BOOL isInProcessing;

@property (nonatomic, assign) BOOL isHasResult;

//出流
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;
//输入流
@property (nonatomic, strong) AVCaptureDeviceInput *activeVideoInput;

// 能否切换前置后置
- (BOOL)canSwitchCameras;

- (AVCaptureDevice *)activeCamera;

- (AVCaptureDevice *)inactiveCamera;
// 闪关灯
- (AVCaptureFlashMode)flashMode;
// 有无手电筒
- (BOOL)cameraHasTorch;

- (AVCaptureTorchMode)torchMode;
// 能否调整焦距
- (BOOL)cameraSupportsTapToFocus;

@end
