//
//  FourViewController.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/6/5.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FourViewController.h"
#import "YYText.h"
#import "Masonry.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableAttributedString *text = [NSMutableAttributedString new];

    NSString * str = @"中新网6月5日电 据山东省临沂临港经济开发区宣传办公室官方微博消息，临沂市临港区金誉石化“6.5”爆炸事故救援指挥部最新消息：截至6月5日16时，经过现场搜救，7名失联人员已全部找到，均不幸遇难。截至目前，事故已造成8人遇难，9人受伤...更多";

    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange  range =  [str rangeOfString:@"...更多"];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_underlineStyle = NSUnderlineStyleNone;
        /// 2. or you can use the convenience method
        [one yy_setTextHighlightRange:range
                                color:[UIColor redColor]
                      backgroundColor:[UIColor clearColor]
                            tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                NSLog(@"wahhahahaha");
                            }];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"中新网6月5日电 据山东省临沂临港经济开发区宣传办公室官方微博消息，临沂市临港区金誉石化“6.5”爆炸事故救援指挥部最新消息：截至6月5日16时，经过现场搜救，7名失联人员已全部找到，均不幸遇难。截至目前，事故已造成8人遇难，9人受伤"]];

    YYLabel *label = [YYLabel new];
    label.attributedText = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
//    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_greaterThanOrEqualTo(200);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
