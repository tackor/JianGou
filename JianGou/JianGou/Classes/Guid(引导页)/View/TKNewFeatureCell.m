//
//  TKNewFeatureCell.m
//  JianGou
//
//  Created by 时空矩人 on 2017/3/9.
//  Copyright © 2017年 时空矩人. All rights reserved.
//

#import "TKNewFeatureCell.h"

@implementation TKNewFeatureCell

- (UIImageView *)imgView {
    
    if (_imgView == nil) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        
        _imgView = imageV;
        
    }
    
    // 注意:一定要加在contentView上
    [self.contentView addSubview:_imgView];
    
    return _imgView;
    
}

@end
