//
//  TKAdItem.h
//  JianGou
//
//  Created by 时空矩人 on 2017/3/9.
//  Copyright © 2017年 时空矩人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKAdItem : NSObject

// 广告图片
@property (nonatomic, strong) NSString *w_picurl;

// 广告图片尺寸
@property (nonatomic, assign) CGFloat w;

// 广告图片尺寸
@property (nonatomic, assign) CGFloat h;

// 点击广告跳转的界面
@property (nonatomic, strong) NSString *ori_curl;

@end
