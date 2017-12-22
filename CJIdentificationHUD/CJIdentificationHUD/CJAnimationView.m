//
//  CJAnimationView.m
//  CJIdentificationHUD
//
//  Created by 创建zzh on 2017/12/19.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "CJAnimationView.h"

@interface CJAnimationView ()

@property (nonatomic, strong) NSMutableArray *pulsingLayers;

//动画layer
@property (nonatomic, strong) CALayer *animationLayer;

//中心layer（固定）
@property (nonatomic, strong) CALayer *thumbnailLayer;

@end

@implementation CJAnimationView

- (id)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.animationLayer = [[CALayer alloc] init];
        self.animationLayer.contentsScale = [UIScreen mainScreen].scale;
        self.animationLayer.zPosition = -1;
        [self.layer addSublayer:self.animationLayer];
        
        
        self.thumbnailLayer = [[CALayer alloc] init];
        self.thumbnailLayer.cornerRadius = 7.5f;
        self.thumbnailLayer.borderWidth = 0.0f;
        self.thumbnailLayer.masksToBounds = YES;
        self.thumbnailLayer.borderColor = [UIColor whiteColor].CGColor;
        self.thumbnailLayer.zPosition = -1;
        self.thumbnailLayer.contentsScale = [UIScreen mainScreen].scale;
        
        [self.layer addSublayer:self.thumbnailLayer];
        
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {
    self.thumbnailLayer.contents  = (__bridge id _Nullable)([UIImage imageNamed:imageName].CGImage);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.bounds;
    
    //中心固定图层大小
    CGRect thumbnailRect = CGRectMake(0, 0, 80, 80);
    thumbnailRect.origin.x = (rect.size.width - thumbnailRect.size.width)/2.0;
    thumbnailRect.origin.y = (rect.size.height - thumbnailRect.size.height)/2.0;
    self.thumbnailLayer.frame = thumbnailRect;
}

- (NSMutableArray *)pulsingLayers {
    if (!_pulsingLayers) {
        _pulsingLayers = [[NSMutableArray alloc] init];
    }
    return _pulsingLayers;
}

- (void)animationBegin {
    CGRect rect = self.bounds;
    NSInteger pulsingCount = 6;
    double animationDuration = 2.0f;
    for (int i = 0; i < pulsingCount; i++) {
        CALayer *pulsingLayer = [[CALayer alloc]init];
        pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pulsingLayer.backgroundColor = self.animationTintColor.CGColor;
        pulsingLayer.borderColor = self.animationTintColor.CGColor;
        pulsingLayer.borderWidth = 1.0;
        pulsingLayer.cornerRadius = rect.size.height/2;
        pulsingLayer.contentsScale = [UIScreen mainScreen].scale;
        
        //速度控制匀速
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
        animationGroup.fillMode = kCAFillModeBoth;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration/(double)pulsingCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE_VAL;
        animationGroup.timingFunction = defaultCurve;
        
        //缩放
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.autoreverses = NO;
        scaleAnimation.fromValue = [NSNumber numberWithDouble:0.2];
        scaleAnimation.toValue = [NSNumber numberWithDouble:1.2];
        
        //透明
        CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        //每个圈圈的透明值和动画时间
        opacityAnimation.values = @[[NSNumber numberWithDouble:0.6],[NSNumber numberWithDouble:0.35],[NSNumber numberWithDouble:0.3],[NSNumber numberWithDouble:0.0]];
        opacityAnimation.keyTimes = @[[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.25],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:1.0]];
        
        //开启动画数组
        animationGroup.animations = @[scaleAnimation,opacityAnimation];
        [pulsingLayer addAnimation:animationGroup forKey:@"pulsing"];
        
        //添加图层
        [self.animationLayer addSublayer:pulsingLayer];
        
        //数组增加
        [self.pulsingLayers addObject:pulsingLayer];
    }
}

- (void)animationStop {
    for (CALayer* pulsingLayer in self.pulsingLayers) {
        [pulsingLayer removeAllAnimations];
        [pulsingLayer removeFromSuperlayer];
    }
    [self.pulsingLayers removeAllObjects];
}


@end
