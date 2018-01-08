//
//  FBYBankCardViewController.m
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

#import "FBYBankCardViewController.h"
#import "FBYBankCardView.h"

#import "FBYBankCardDetailViewController.h"

@interface FBYBankCardViewController ()

@property (nonatomic, strong) FBYBankCardView *FBYBankCardView;

@end

@implementation FBYBankCardViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.cameraManager doSomethingWhenWillDisappear];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.cameraManager doSomethingWhenWillAppear];
}

- (FBYScanBankCard *)cameraManager {
    if (!_cameraManager) {
        _cameraManager = [[FBYScanBankCard alloc] init];
    }
    return _cameraManager;
}

- (FBYBankCardView *)FBYBankCardView {
    if(!_FBYBankCardView) {
        CGRect rect = [FBYBankCardView getOverlayFrame:[UIScreen mainScreen].bounds];
        _FBYBankCardView = [[FBYBankCardView alloc] initWithFrame:rect];
    }
    return _FBYBankCardView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"银行卡扫描";
    
    [self.view insertSubview:self.FBYBankCardView atIndex:0];
    
    self.cameraManager.sessionPreset = AVCaptureSessionPreset1280x720;
    
    if ([self.cameraManager configBankScanManager]) {
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view insertSubview:view atIndex:0];
        AVCaptureVideoPreviewLayer *preLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.cameraManager.captureSession];
        preLayer.frame = [UIScreen mainScreen].bounds;
        
        preLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        [view.layer addSublayer:preLayer];
        
        [self.cameraManager startSession];
        
    }
    else {
        NSLog(@"打开相机失败");
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    [self.cameraManager.bankScanSuccess subscribeNext:^(id x) {
        [self showResult:x];
    }];
    [self.cameraManager.scanError subscribeNext:^(id x) {
        
    }];
}

- (void)showResult:(id)result {
    FBYBankCardModel *model = (FBYBankCardModel *)result;
    
    FBYBankCardDetailViewController *bcdvc = [[FBYBankCardDetailViewController alloc]init];
    
    bcdvc.FBYBankCardModel = model;
    [self.navigationController pushViewController:bcdvc animated:YES];
    
//    NSLog(@"%@",model.bankName);
    
//    NSString *message = [NSString stringWithFormat:@"%@\n%@", model.bankName, model.bankNumber];
//    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"扫描成功" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//    [alertV show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
