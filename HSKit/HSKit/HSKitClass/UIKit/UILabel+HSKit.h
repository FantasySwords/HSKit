//
//  UILabel+HSKit.h
//  HSKit
//
//  Created by hejianyuan on 2016/9/19.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HSKit)

+ (UILabel *)label;

- (instancetype)initWithFrame:(CGRect)frame
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment
                numberOfLines:(NSInteger)numberOflines;

- (UILabel * (^)(UIFont *))hs_font;
- (UILabel * (^)(UIColor *))hs_textColor;
- (UILabel * (^)(NSTextAlignment))hs_textAlignment;
- (UILabel * (^)(NSLineBreakMode))hs_lineBreakMode;
- (UILabel * (^)(NSInteger))hs_numberOfLines;

- (UILabel * (^)(CGRect))hs_frame;
- (UILabel * (^)(CGRect))hs_bounds;
- (UILabel * (^)(UIColor *))hs_backgroundColor;

- (UILabel * (^)(NSString *))hs_text;

@end
