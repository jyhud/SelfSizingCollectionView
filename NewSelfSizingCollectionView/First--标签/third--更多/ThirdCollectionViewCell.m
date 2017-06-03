//
//  ThirdCollectionViewCell.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/6/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ThirdCollectionViewCell.h"
#import "Masonry.h"
#import "UILabel+GQLabel.h"

@interface ThirdCollectionViewCell()

@end

@implementation ThirdCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

//    self.firstLabel = [[UILabel alloc]initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
//    [self.contentView addSubview:self.firstLabel];
//
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    }];
}



-(void)configureData:(ThirdModel *)model{


    if (model) {

//        self.firstLabel.numberOfLines = 0;
//        self.firstLabel.font = [UIFont systemFontOfSize:14];
//        self.firstLabel.text = @"特朗普曾称气候变化是骗局，并在选举期间威胁要退出《巴黎协定》。他就任以来要求评估修改奥巴马政府制定的旨在减少发电厂碳排放的《清洁电力计划》。特朗普政府提出的2018财年联邦政府预算也提议停止向一些联合国应对气候变化项目拨款，并大幅削减美国环保局的预算";
//        self.firstLabel.text = [UILabel textOfOnePointNumber:self.firstLabel];
        
        self.myLabel.text = model.address;
        self.myLabel.text = [UILabel textOfOnePointNumber:self.myLabel];
        
//        [self.secondLabel gq_addAttributeTapActionWithStrings:@[@"更多"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
//            
//            NSLog(@"设置是否有点击效果，默认是YES");
//            
//        }];
//        //设置是否有点击效果，默认是YES
//        self.secondLabel.enabledTapEffect = YES;
        
    }


}

@end
