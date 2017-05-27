//
//  SecondCollectionViewCell.h
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/5/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"


@interface SecondCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

-(void)configureData:(SecondModel *)model;

@end
