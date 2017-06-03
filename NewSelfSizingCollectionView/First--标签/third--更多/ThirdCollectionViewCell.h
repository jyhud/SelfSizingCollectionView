//
//  ThirdCollectionViewCell.h
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/6/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdModel.h"

@interface ThirdCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UILabel * firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;


-(void)configureData:(ThirdModel *)model;


@end
