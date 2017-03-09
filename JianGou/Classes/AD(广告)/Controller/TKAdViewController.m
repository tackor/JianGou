//
//  TKAdViewController.m
//  JianGou
//
//  Created by 时空矩人 on 2017/3/9.
//  Copyright © 2017年 时空矩人. All rights reserved.
//

#import "TKAdViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+WebCache.h>

@interface TKAdViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation TKAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.adImageView sd_setImageWithURL:[NSURL URLWithString:AD_URL]];
    
    // 搞个定时器,控制广告时间
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AD_CONTENT_URL] options:@{} completionHandler:nil];
}

- (void)timeChange:(id)timer {
    static int i = 2;
    if (i < 0) { // 2秒，销毁当前界面和定时器
        [self jump:nil];
    }
    i--;
}

- (void)jump:(id)sender {
    [self.timer invalidate];
    
    UIViewController *tabBarVc = [[UIViewController alloc] init];
    tabBarVc.view.backgroundColor = [UIColor redColor];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
}

@end
