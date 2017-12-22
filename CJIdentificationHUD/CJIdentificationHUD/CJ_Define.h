//
//  CJ_Define.h
//  CJIdentificationHUD
//
//  Created by 创建zzh on 2017/12/19.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#ifndef CJ_Define_h
#define CJ_Define_h

#define kCJScreenBounds [UIScreen mainScreen].bounds
#define kCJScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kCJScreenHeight [UIScreen mainScreen].bounds.size.height

#define CJ_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define  CJ_StatusBarHeight      (CJ_iPhoneX ? 44.f : 20.f)

#define  CJ_NavigationBarHeight  44.f

#define  CJ_TabbarHeight         (CJ_iPhoneX ? (49.f+34.f) : 49.f)

#define  CJ_TabbarSafeBottomMargin         (CJ_iPhoneX ? 34.f : 0.f)

#define  CJ_StatusBarAndNavigationBarHeight  (CJ_iPhoneX ? 88.f : 64.f)

#define CJ_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})


#define kCJIdenficationHUDWidth 80.f

#define CJ_RGBA(r,g,b,a)           [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]



#endif /* CJ_Define_h */
