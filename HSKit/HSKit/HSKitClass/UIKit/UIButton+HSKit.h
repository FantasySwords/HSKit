//
//  UIButton+HSKit.h
//  HSKit
//
//  Created by hejianyuan on 2016/9/19.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIControl+HSKit.h"

@interface UIButton (HSKit)

/**
 * 返回一个UIButtonTypeCustom类型的按钮
 */
+ (UIButton *)button;

- (UIButton * (^)(UIFont *))hs_font;

- (UIButton * (^)(CGRect))hs_frame;
- (UIButton * (^)(CGRect))hs_bounds;
- (UIButton * (^)(UIColor *))hs_backgroundColor;


- (UIButton * (^)(NSString *, UIControlState))hs_setTitle;
- (UIButton * (^)(UIColor *, UIControlState))hs_setTitleColor;
- (UIButton * (^)(UIImage *, UIControlState))hs_setImage;
- (UIButton * (^)(UIImage *, UIControlState))hs_setBackgroundImage;


/**
 * 可以使用掩码的方式，设置对应State，比如 HSControlStateNormalMask | HSControlStateHighlightedMask，可以同时配置normal和highlighted状态下的控件内容
 *
 */
- (void)setTitleExt:(NSString *)title forState:(HSControlStateMask)mask;


- (void)setTitleColorExt:(UIColor *)color forState:(HSControlStateMask)mask;


- (void)setImageExt:(UIImage *)image forState:(HSControlStateMask)mask;


- (void)setBackgroundImageExt:(UIImage *)image forState:(HSControlStateMask)mask;


- (void)setAttributedTitleExt:(NSAttributedString *)title forState:(HSControlStateMask)mask NS_AVAILABLE_IOS(6_0);



@end
