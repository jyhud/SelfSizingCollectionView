//
//  FourViewController.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/6/5.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FourViewController.h"
#import "YYText.h"
#import "NSString+YYAdd.h"
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
        one.yy_font = [UIFont systemFontOfSize:15];

        one.yy_underlineStyle = NSUnderlineStyleNone;
        /// 2. or you can use the convenience method
        [one yy_setTextHighlightRange:range
                                color:[UIColor redColor]
                      backgroundColor:[UIColor clearColor]
                            tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                NSLog(@"wahhahahaha");
                            }];
        
        [text appendAttributedString:one];
        text.yy_lineSpacing = 5;


    YYLabel *label = [YYLabel new];
    label.attributedText = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
//    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    /*
     YYLabel *contentL = [[YYLabel alloc] init];
     //设置多行
     contentL.numberOfLines = 0;
     //这个属性必须设置，多行才有效
     contentL.preferredMaxLayoutWidth = kScreenWidth -32;
     
     NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithAttributedString:[OSCBaseCommetView contentStringFromRawString:commentItem.content withFont:24.0]];
     
     //可以将要插入的图片作为特殊字符处理
     //需要使用 YYAnimatedImageView 控件，直接使用UIImage添加无效。
     
     YYAnimatedImageView *imageView1= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:@"ic_quote_left"]];
     imageView1.frame = CGRectMake(0, 0, 16, 16);
     
     YYAnimatedImageView *imageView2= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:@"ic_quote_right"]];
     imageView2.frame = CGRectMake(0, 0, 16, 16);
     // attchmentSize 修改，可以处理内边距
     NSMutableAttributedString *attachText1= [NSMutableAttributedString attachmentStringWithContent:imageView1 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView1.frame.size alignToFont:[UIFont systemFontOfSize:24] alignment:YYTextVerticalAlignmentCenter];
     
     NSMutableAttributedString *attachText2= [NSMutableAttributedString attachmentStringWithContent:imageView2 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView2.frame.size alignToFont:[UIFont systemFontOfSize:24] alignment:YYTextVerticalAlignmentCenter];
     
     //插入到开头
     [attri insertAttributedString:attachText1 atIndex:0];
     //插入到结尾
     [attri appendAttributedString:attachText2];
     
     //用label的attributedText属性来使用富文本
     contentL.attributedText = attri;
     
     CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 32, MAXFLOAT);
     
     //计算文本尺寸
     YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:attri];
     contentL.textLayout = layout;
     CGFloat introHeight = layout.textBoundingSize.height;
     
     
     contentL.frame =  commentItem.layoutInfo.contentTextViewFrame;
     contentL.width = maxSize.width;
     
     contentL.height = introHeight + 50;
     
     [self addSubview:contentL];
     */
    
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 32, MAXFLOAT);
    
    //计算文本尺寸
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:text];
    label.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(introHeight);
        
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
