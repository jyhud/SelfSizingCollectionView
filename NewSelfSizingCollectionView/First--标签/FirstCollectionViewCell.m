//
//  FirstCollectionViewCell.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/5/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FirstCollectionViewCell.h"
#import "Masonry.h"

@implementation FirstCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.top.mas_equalTo(0);
        make.width.mas_greaterThanOrEqualTo(100);
        make.width.mas_lessThanOrEqualTo([UIScreen mainScreen].bounds.size.width);
    
    }];

}

@end
