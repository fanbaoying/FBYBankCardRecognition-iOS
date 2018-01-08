//
//  FBYBankCardView.m
//  FBYBankCardRecognition-iOS
//
//  Created by fby on 2018/1/4.
//  Copyright © 2018年 FBYIDCardRecognition-iOS. All rights reserved.
//

#import "FBYBankCardView.h"
@interface FBYBankCardView() {
    CAShapeLayer *_BankCardScanningWindowLayer;
}

@property (nonatomic, assign) BOOL showLine;
@property (nonatomic, assign) int lineLenght;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation FBYBankCardView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = frame.size.height;
        CGFloat height = frame.size.width;
        
        self.backgroundColor = [UIColor clearColor];
        _lineLenght = height / 10;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.25 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
        [self.timer fire];
        _showLine = NO;
        
        
        // 提示标签
        CGPoint center = self.center;
        center.x = CGRectGetMaxX(_BankCardScanningWindowLayer.frame) + 240;
        
        center.y = CGRectGetMaxY(_BankCardScanningWindowLayer.frame) + 180;
        
        [self addTipLabelWithText:@"请将左右边对齐扫描线对准银行卡号" center:center];
    }
    return self;
}

#pragma mark - 添加提示标签
-(void )addTipLabelWithText:(NSString *)text center:(CGPoint)center {
    UILabel *tipLabel = [[UILabel alloc] init];
    
    tipLabel.text = text;
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    tipLabel.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    [tipLabel sizeToFit];
    
    tipLabel.center = center;
    
    [self addSubview:tipLabel];
}


-(void)timerFire:(id)notice {
    _showLine = !_showLine;
    [self setNeedsDisplay];
}

-(void)dealloc {
    [self.timer invalidate];
}

//画边框和线
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 8.0);
    CGContextSetRGBStrokeColor(context, .3, 0.8, .3, .8);
    
    CGContextBeginPath(context);
    
    CGPoint pt = rect.origin;
    CGContextMoveToPoint(context, pt.x, pt.y+_lineLenght);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    
    pt = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    CGContextAddLineToPoint(context, pt.x, pt.y+_lineLenght);
    
    pt = CGPointMake(rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
    CGContextMoveToPoint(context, pt.x, pt.y-_lineLenght);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    
    pt = CGPointMake(rect.origin.x, rect.origin.y+rect.size.height);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    CGContextAddLineToPoint(context, pt.x, pt.y-_lineLenght);
    CGContextStrokePath(context);
    
    if(_showLine)
    {
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, 1);
        CGPoint p1, p2;
        float x = rect.origin.x + rect.size.width * 22 / 54;
        p1 = CGPointMake(x, rect.origin.y);
        p2 = CGPointMake(x, rect.origin.y + rect.size.height);
        CGContextMoveToPoint(context,p1.x, p1.y);
        CGContextAddLineToPoint(context, p2.x, p2.y);
        CGContextStrokePath(context);
    }
}

+ (CGRect)getOverlayFrame:(CGRect)rect {
    float previewWidth = rect.size.width;
    float previewHeight = rect.size.height;
    
    float cardh, cardw;
    float left, top;
    
    cardw = previewWidth*70/100;
    //if(cardw < 720) cardw = 720;
    if(previewWidth < cardw)
    cardw = previewWidth;
    
    cardh = (int)(cardw / 0.63084f);
    
    left = (previewWidth-cardw)/2;
    top = (previewHeight-cardh)/2;
    
    return CGRectMake(left, top, cardw, cardh);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
