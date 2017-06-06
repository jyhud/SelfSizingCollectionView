//
//  UILabel+GQLabel.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/6/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UILabel+GQLabel.h"
#import <CoreText/CoreText.h>
#import <objc/runtime.h>

@implementation UILabel (GQLabel)

+ (NSString *)textOfOnePointNumber:(UILabel *)label{
   
    NSString *text = [label text];
    UIFont   *font = [label font];
    CGRect    rect = [label frame];
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), ([font pointSize]), NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    
//    CTLineBreakMode lineBreakMode = (CTLineBreakMode)label.lineBreakMode;//换行模式
//    CTTextAlignment alignment =(CTTextAlignment)label.lineBreakMode;//对齐方式
//    //    float lineSpacing =2.0;//行间距
//    CTParagraphStyleSetting paraStyles[2] = {
//        
//        {.spec = kCTParagraphStyleSpecifierLineBreakMode,.valueSize = sizeof(CTLineBreakMode), .value = (const void*)&lineBreakMode},
//        
//        {.spec = kCTParagraphStyleSpecifierAlignment,.valueSize = sizeof(CTTextAlignment), .value = (const void*)&alignment},
//        
//        //        {.spec = kCTParagraphStyleSpecifierLineSpacingAdjustment,.valueSize = sizeof(CGFloat), .value = (const void*)&lineSpacing},
//        
//    };
//    
//    CTParagraphStyleRef style = CTParagraphStyleCreate(paraStyles,2);
//    [attStr addAttribute:(NSString*)(kCTParagraphStyleAttributeName) value:(id)style range:NSMakeRange(0,[text length])];
    
    
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width-10,100000));
    
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
        stringLast = [NSMutableString stringWithFormat:@"%@",label.text];
    }
    return stringLast;
}


@end
