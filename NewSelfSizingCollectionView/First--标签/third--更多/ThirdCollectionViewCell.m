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
#import "YYText.h"

@interface ThirdCollectionViewCell()

@property(nonatomic,strong)YYLabel * yy_label;

@end

@implementation ThirdCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    }];
    
    self.yy_label = [YYLabel new];
    self.yy_label.textAlignment = NSTextAlignmentLeft;
    self.yy_label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    self.yy_label.numberOfLines = 0;
    self.yy_label.font = [UIFont systemFontOfSize:20];
    //    label.lineBreakMode = NSLineBreakByWordWrapping;
    self.yy_label.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.yy_label];
    
    [self.yy_label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.trailing.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];

}

-(void)configureData:(ThirdModel *)model{

    if (model) {
        
        self.yy_label.text = model.address;
        NSString * string = [self textWithString:model.address andFont:[UIFont systemFontOfSize:20] andWith:[UIScreen mainScreen].bounds.size.width];
        
        NSLog(@"string is\n\n %@",string);
        
        
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT);
        NSMutableAttributedString * muteStr = [[NSMutableAttributedString alloc] initWithString:string];
        muteStr.yy_font = [UIFont systemFontOfSize:20];
        
        NSRange  range =  [string rangeOfString:@"...更多"];
        [muteStr yy_setTextHighlightRange:range
                                color:[UIColor redColor]
                      backgroundColor:[UIColor clearColor]
                            tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                NSLog(@"wahhahahaha");
                                if (self.delegate&& [self.delegate respondsToSelector:@selector(clickMore)]) {
                                    
                                    [self.delegate clickMore];
                                    
                                }
                                
                                
                            }];
        
        self.yy_label.attributedText = muteStr;
        //计算文本尺寸
        YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:  muteStr];
        self.yy_label.textLayout = layout;
        CGFloat introHeight = layout.textBoundingSize.height;

        [self.yy_label mas_updateConstraints:^(MASConstraintMaker *make) {
    
            make.height.mas_equalTo(introHeight);
        }];
        [self layoutIfNeeded];
    }

}


-(NSString *)textWithString:(NSString *)contentStr andFont:(UIFont *)contentfont andWith:(CGFloat)contentWidth{
    
    NSString *text = contentStr;
    UIFont   *font = contentfont;
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), ([font pointSize]), NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,contentWidth-10,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines){
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    //处理数组中的数据
    NSMutableString *stringLast = [NSMutableString new];
    //先判断返回的数组长度是否大于2；
    
    if(linesArray.count>3){
        
        NSLog(@"-----%lu-----%lu",(unsigned long)[linesArray[2] length],(unsigned long)[linesArray[0] length]);
        
        stringLast = [NSMutableString stringWithFormat:@"%@%@%@",
                      linesArray[0],linesArray[1],
                      [linesArray[2] substringToIndex:[linesArray[0] length]-3]];
        [stringLast appendString:@"...更多"];
        
        
    }else{//长度为1
        return contentStr;
    }
    return stringLast;
}


@end
