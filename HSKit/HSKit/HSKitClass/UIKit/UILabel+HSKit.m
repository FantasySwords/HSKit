//
//  UILabel+HSKit.m
//  HSKit
//
//  Created by hejianyuan on 2016/9/19.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "UILabel+HSKit.h"

@implementation UILabel (HSKit)

+ (UILabel *)label
{
    return [[UILabel alloc] init];
}


- (instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOflines
{
    if (self = [self initWithFrame:frame]) {
        self.font = font;
        self.textColor = textColor;
        self.textAlignment = textAlignment;
        self.numberOfLines = numberOflines;
    }
    return self;
}

- (UILabel * (^)(UIFont *))hs_font
{
    return ^UILabel * (UIFont * font){
        self.font = font;
        return self;
    };
}


- (UILabel * (^)(UIColor *))hs_textColor
{
    return ^UILabel * (UIColor * color){
        self.textColor = color;
        return self;
    };
}

- (UILabel * (^)(NSTextAlignment))hs_textAlignment
{
    return ^UILabel * (NSTextAlignment textAlignmeng){
        self.textAlignment = textAlignmeng;
        return self;
    };
}

- (UILabel * (^)(NSLineBreakMode))hs_lineBreakMode
{
    return ^UILabel * (NSLineBreakMode lineBreadMode){
        self.lineBreakMode = lineBreadMode;
        return self;
    };
}


- (UILabel * (^)(NSInteger))hs_numberOfLines
{
    return ^UILabel * (NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}

- (UILabel * (^)(CGRect))hs_frame
{
    return ^UILabel * (CGRect frame){
        self.frame = frame;
        return self;
    };
}


- (UILabel * (^)(CGRect))hs_bounds
{
    return ^UILabel * (CGRect bounds){
        self.bounds = bounds;
        return self;
    };
}

- (UILabel * (^)(UIColor *))hs_backgroundColor
{
    return ^UILabel * (UIColor * backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}

- (UILabel * (^)(NSString *))hs_text
{
    return ^UILabel * (NSString * text){
        self.text = text;
        return self;
    };
}

@end
