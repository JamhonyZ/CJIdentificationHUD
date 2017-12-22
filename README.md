# CJIdentificationHUD
网易云音乐听歌识曲动画

#pragma mark -- 加载框功能

/* 默认显示 如果是加载框功能 */
+ (void)showLoadingInView:(UIView *)view;

/* 显示 赋值背景色 加载功能 */
+ (void)showLoadingInView:(UIView *)view backgroundColor:(UIColor *)color;

#pragma mark -- 识别功能

/**
*  显示所在的view
*  中心图片名字
*  显示文字
*/

+ (void)showInView:(UIView *)view image:(NSString *)imageName showTitle:(NSString *)title;

