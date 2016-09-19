//
//  UIButton+HSKit.m
//  HSKit
//
//  Created by hejianyuan on 2016/9/19.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "UIButton+HSKit.h"

@implementation UIButton (HSKit)

+ (UIButton *)button
{
    return [UIButton buttonWithType:UIButtonTypeCustom];
}

- (UIButton * (^)(UIFont *))hs_font
{
    return ^UIButton *(UIFont * font){
        self.titleLabel.font = font;
        return self;
    };
}


- (UIButton * (^)(CGRect))hs_frame
{
    return  ^UIButton *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton * (^)(CGRect))hs_bounds
{
    return ^UIButton *(CGRect bounds){
        self.bounds = bounds;
        return self;
    };
}

- (UIButton * (^)(UIColor *))hs_backgroundColor
{
    return ^UIButton *(UIColor *backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}


- (UIButton * (^)(NSString *, UIControlState))hs_setTitle
{
    return ^UIButton *(NSString * title, UIControlState controlState){
        [self setTitle:title forState:controlState];
        return self;
    };
}

- (UIButton * (^)(UIColor *, UIControlState))hs_setTitleColor
{
    return ^UIButton *(UIColor * color, UIControlState controlState){
        [self setTitleColor:color forState:controlState];
        return self;
    };
}

- (UIButton * (^)(UIImage *, UIControlState))hs_setImage
{
    return ^UIButton *(UIImage * image, UIControlState controlState){
        [self setImage:image forState:controlState];
        return self;
    };
}


- (UIButton * (^)(UIImage *, UIControlState))hs_setBackgroundImage
{
    return ^UIButton *(UIImage * image, UIControlState controlState){
        [self setBackgroundImage:image forState:controlState];
        return self;
    };
}


- (void)setTitleExt:(nullable NSString *)title forState:(HSControlStateMask)mask
{
    
}


- (void)setTitleColorExt:(nullable UIColor *)color forState:(HSControlStateMask)mask
{
    
}


- (void)setImageExt:(nullable UIImage *)image forState:(HSControlStateMask)mask
{
    
}


- (void)setBackgroundImageExt:(nullable UIImage *)image forState:(HSControlStateMask)mask
{
    
}


- (void)setAttributedTitleExt:(nullable NSAttributedString *)title forState:(HSControlStateMask)mask NS_AVAILABLE_IOS(6_0)
{
    
}


@end
