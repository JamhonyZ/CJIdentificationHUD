//
//  ViewController.m
//  CJIdentificationHUD
//
//  Created by 创建zzh on 2017/12/19.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "ViewController.h"
#import "CJIdentificationHUD.h"
#import "CJ_Define.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *showHUD = [UIButton buttonWithType:UIButtonTypeCustom];
    [showHUD setTitle:@"识别" forState:UIControlStateNormal];
    showHUD.frame = CGRectMake(50, 100, 60, 20);
    [showHUD setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    showHUD.titleLabel.font = [UIFont systemFontOfSize:15];
    showHUD.tag = 100;
    [showHUD addTarget:self action:@selector(showAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showHUD];
    
    
    UIButton *showLodingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [showLodingBtn setTitle:@"加载" forState:UIControlStateNormal];
    showLodingBtn.frame = CGRectMake(120, 100, 60, 20);
    showLodingBtn.tag = 101;
    [showLodingBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    showLodingBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [showLodingBtn addTarget:self action:@selector(showAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showLodingBtn];

}

- (void)showAction:(UIButton *)btn {
    if (btn.tag == 100) {
        self.view.backgroundColor = [UIColor blackColor];
        [CJIdentificationHUD showInView:self.view image:@"CJ_Logo" showTitle:@"正在识别歌曲"];
    } else {
        [CJIdentificationHUD showLoadingInView:self.view];
    }
    [self performSelector:@selector(hiddenHUD) withObject:nil afterDelay:5];
}

- (void)hiddenHUD {
    [CJIdentificationHUD hideInView:self.view];
    self.view.backgroundColor = [UIColor whiteColor];
}



@end
