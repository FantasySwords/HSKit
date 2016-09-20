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
    if (HSControlStateMaskNormal & mask) [self setTitle:title forState:UIControlStateNormal];
    if (HSControlStateMaskHighlighted & mask) [self setTitle:title forState:UIControlStateHighlighted];
    if (HSControlStateMaskSelected & mask) [self setTitle:title forState:UIControlStateSelected];
    if (HSControlStateMaskDisabled & mask) [self setTitle:title forState:UIControlStateDisabled];
    if (HSControlStateFocused & mask) [self setTitle:title forState:UIControlStateFocused];
}

- (void)setTitleColorExt:(nullable UIColor *)color forState:(HSControlStateMask)mask
{
    if (HSControlStateMaskNormal & mask) [self setTitleColor:color forState:UIControlStateNormal];
    if (HSControlStateMaskHighlighted & mask) [self setTitleColor:color forState:UIControlStateHighlighted];
    if (HSControlStateMaskSelected & mask) [self setTitleColor:color forState:UIControlStateSelected];
    if (HSControlStateMaskDisabled & mask) [self setTitleColor:color forState:UIControlStateDisabled];
    if (HSControlStateFocused & mask) [self setTitleColor:color forState:UIControlStateFocused];
}

- (void)setImageExt:(nullable UIImage *)image forState:(HSControlStateMask)mask
{
    if (HSControlStateMaskNormal & mask) [self setImage:image forState:UIControlStateNormal];
    if (HSControlStateMaskHighlighted & mask) [self setImage:image forState:UIControlStateHighlighted];
    if (HSControlStateMaskSelected & mask) [self setImage:image forState:UIControlStateSelected];
    if (HSControlStateMaskDisabled & mask) [self setImage:image forState:UIControlStateDisabled];
    if (HSControlStateFocused & mask) [self setImage:image forState:UIControlStateFocused];
}

- (void)setBackgroundImageExt:(nullable UIImage *)image forState:(HSControlStateMask)mask
{
    if (HSControlStateMaskNormal & mask) [self setBackgroundImage:image forState:UIControlStateNormal];
    if (HSControlStateMaskHighlighted & mask) [self setBackgroundImage:image forState:UIControlStateHighlighted];
    if (HSControlStateMaskSelected & mask) [self setBackgroundImage:image forState:UIControlStateSelected];
    if (HSControlStateMaskDisabled & mask) [self setBackgroundImage:image forState:UIControlStateDisabled];
    if (HSControlStateFocused & mask) [self setBackgroundImage:image forState:UIControlStateFocused];
}

- (void)setAttributedTitleExt:(nullable NSAttributedString *)title forState:(HSControlStateMask)mask NS_AVAILABLE_IOS(6_0)
{
    if (HSControlStateMaskNormal & mask) [self setAttributedTitle:title forState:UIControlStateNormal];
    if (HSControlStateMaskHighlighted & mask) [self setAttributedTitle:title forState:UIControlStateHighlighted];
    if (HSControlStateMaskSelected & mask) [self setAttributedTitle:title forState:UIControlStateSelected];
    if (HSControlStateMaskDisabled & mask) [self setAttributedTitle:title forState:UIControlStateDisabled];
    if (HSControlStateFocused & mask) [self setAttributedTitle:title forState:UIControlStateFocused];
}


@end
