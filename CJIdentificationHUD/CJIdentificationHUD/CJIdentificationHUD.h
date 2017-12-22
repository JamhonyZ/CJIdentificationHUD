//
//  CJIdentificationHUD.h
//  CJIdentificationHUD
//
//  Created by 创建zzh on 2017/12/19.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJAnimationView.h"

@interface CJIdentificationHUD : UIView


/**
 * 动画图层
 */
@property (nonatomic, strong) CJAnimationView *animationView;


#pragma mark -- 加载框功能

/**
 * 默认显示 如果是加载框功能
 */
+ (void)showLoadingInView:(UIView *)view;

/**
 * 显示 赋值背景色 加载功能
 */
+ (void)showLoadingInView:(UIView *)view backgroundColor:(UIColor *)color;




#pragma mark -- 识别功能
/**
 *  显示所在的view
 *  中心图片名字
 *  显示文字
 */
+ (void)showInView:(UIView *)view
             image:(NSString *)imageName
         showTitle:(NSString *)title;



#pragma mark -- 其他方法
/**
 * 隐藏
 */
+ (void)hideInView:(UIView *)view;

/**
 *  从fatherView中移除
 */
+ (void)removeLoadingView:(UIView *)fatherView;


//允许外部获取 当前HUD
+ (CJIdentificationHUD *)getCurrentIncator:(UIView *)view;


@end
