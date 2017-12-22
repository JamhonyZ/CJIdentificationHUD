//
//  CJAnimationView.h
//  CJIdentificationHUD
//
//  Created by 创建zzh on 2017/12/19.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CJAnimationView : UIView

//动画颜色
@property (nonatomic,strong) UIColor *animationTintColor;

/**中心图片名字**/
@property (nonatomic, copy)NSString *imageName;

//开始动画
- (void)animationBegin;

//结束动画
- (void)animationStop;
@end
