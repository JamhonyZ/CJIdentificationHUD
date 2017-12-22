//
//  CJIdentificationHUD.m
//  CJIdentificationHUD
//
//  Created by 创建zzh on 2017/12/19.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "CJIdentificationHUD.h"
#import "CJ_Define.h"

@implementation CJIdentificationHUD

#pragma mark -- 初始化
- (id)init {
    self = [super initWithFrame:kCJScreenBounds];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.animationView = [[CJAnimationView alloc] initWithFrame:CGRectMake(0, CJ_StatusBarAndNavigationBarHeight, kCJScreenWidth, kCJScreenWidth)];
        self.animationView.animationTintColor = [UIColor yellowColor];
        [self addSubview:self.animationView];
    }
    return self;
}


- (id)initWithBackgroundColor:(UIColor *)color {
    self = [super initWithFrame:kCJScreenBounds];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.animationView = [[CJAnimationView alloc]
                              initWithFrame:CGRectMake((kCJScreenWidth - kCJIdenficationHUDWidth)/2,
                                                       (kCJScreenHeight - kCJIdenficationHUDWidth)/2,
                                                       kCJIdenficationHUDWidth,
                                                       kCJIdenficationHUDWidth)];
        self.animationView.animationTintColor = color;
        [self addSubview:self.animationView];
    }
    return self;
}

+ (CJIdentificationHUD *)getCurrentIncator:(UIView *)view {
    for (UIView *aView in view.subviews) {
        if ([aView isMemberOfClass:[CJIdentificationHUD class]]) {
            CJIdentificationHUD *loadingView = (CJIdentificationHUD *)aView;
            return loadingView;
        }
    }
    return nil;
}

#pragma mark -- 展示
+ (void)showLoadingInView:(UIView *)view {
    
    [[self class] removeLoadingView:view];
    
    //创建
    CJIdentificationHUD* loadingView = [[CJIdentificationHUD alloc] initWithBackgroundColor:[UIColor grayColor]];
    [view addSubview:loadingView];
    loadingView.hidden = NO;
    [loadingView.animationView animationBegin];
}


+ (void)showLoadingInView:(UIView *)view backgroundColor:(UIColor *)color {
    
    [[self class] removeLoadingView:view];
    
    //创建
    CJIdentificationHUD* loadingView = [[CJIdentificationHUD alloc] initWithBackgroundColor:color];
    [view addSubview:loadingView];
    loadingView.hidden = NO;
    [loadingView.animationView animationBegin];
}



+ (void)showInView:(UIView *)view
             image:(NSString *)imageName
         showTitle:(NSString *)title {
    
    //先清除
    [[self class] removeLoadingView:view];
    
    //再创建
    CJIdentificationHUD *loadingView = [[CJIdentificationHUD alloc] init];
    [view addSubview:loadingView];
    loadingView.hidden = NO;
    [loadingView.animationView animationBegin];
    
    //展示的图片
    loadingView.animationView.imageName = imageName;
    
    
    //展示的文字
    UILabel *showLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(loadingView.frame)+20, kCJScreenWidth, 22)];
    showLabel.font = [UIFont systemFontOfSize:17];
    showLabel.textColor = [UIColor blackColor];
    showLabel.textAlignment = NSTextAlignmentCenter;
    showLabel.tag = 1002;
    showLabel.text = title;
    [view addSubview:showLabel];
    
}

+ (void)removeLoadingView:(UIView *)fatherView {
    for (UIView *aView in fatherView.subviews) {
        if ([aView isMemberOfClass:[CJIdentificationHUD class]]) {
            CJIdentificationHUD *loadingView = (CJIdentificationHUD *)aView;
            [loadingView.animationView animationStop];
            [[fatherView viewWithTag:1002] removeFromSuperview];
            [loadingView removeFromSuperview];
            break;
        }
    }
}

+ (void)hideInView:(UIView *)view {
    for (UIView* aView in view.subviews) {
        if ([aView isMemberOfClass:[CJIdentificationHUD class]]) {
            CJIdentificationHUD *loadingView = (CJIdentificationHUD *)aView;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                               [UIView animateWithDuration:0.3 animations:^{
                                   loadingView.alpha = 0.0f;
                                   [view viewWithTag:1002].alpha = 0.0f;
                               }completion:^(BOOL finished) {
                                   [loadingView.animationView animationStop];
                                   [loadingView removeFromSuperview];
                                   [[view viewWithTag:1002] removeFromSuperview];
                               }];
                           });
        }
    }
}


@end
