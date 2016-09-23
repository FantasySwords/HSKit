//
//  UIColor+HSKit.h
//  HSKit
//
//  Created by 东电创新 on 16/9/20.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (HSKit)


/**
 * 返回一个随机颜色的UIColor
 */
 + (UIColor *)randomColor;

/**
 * 通过RGB各分量获取UIColor对象
 * @param red   取值[0 .. 1]
 * @param green 取值[0 .. 1]
 * @param blue  取值[0 .. 1]
 */
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 * 通过RGBA各分量获取UIColor对象
 * @param red   取值[0 .. 255]
 * @param green 取值[0 .. 255]
 * @param blue  取值[0 .. 255]
 * @param alpha 取值[0 .. 1]
 */
+ (UIColor *)colorExtWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 * 通过RGB各分量获取UIColor对象
 * @param red   取值[0 .. 255]
 * @param green 取值[0 .. 255]
 * @param blue  取值[0 .. 255]
 */
+ (UIColor *)colorExtWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;


/**
 * 通过RGB数值获取UIColor对象
 * @param value 可以写成 0x448744
 */
+ (UIColor *)colorWithRGBValue:(NSUInteger)value;

/**
 * 通过RGB数值获取UIColor对象
 * @param value 可以写成 0x448744ff
 */
+ (UIColor *)colorWithRGBAValue:(NSUInteger)value;

/**
 * 将CSS 16进制颜色值转换为UIColor
 * 支持类型：#RGB #RGBA #RRGGBB #RRGGBBAA
 * 支持类型：0xRGB 0xRGBA 0xRRGGBB 0xRRGGBBAA
 * #RGB 0xRGB 和#RRGGBB是等值的
 * #RGBA 0xRGBA 和#RRGGBBAA是等值的
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 * 返回该UIColor对象对应的额整数值 不包含alpha分量
 */
@property (nonatomic, assign, readonly) NSUInteger rgbValue;

/**
 * 返回该UIColor对象对应的额整数值 包含alpha分量
 */
@property (nonatomic, assign, readonly) NSUInteger rgbaValue;

/**
 * 返回该UIColor对象对应的16进制颜色值得字符串 不包含alpha分量
 * 返回格式： #RRGGBB
 */
@property (nonatomic, copy, readonly) NSString * rgbHexString;

/**
 * 返回该UIColor对象对应的16进制颜色值得字符串 包含alpha分量
 * 返回格式： #RRGGBBAA
 */
@property (nonatomic, copy, readonly) NSString * rgbaHexString;


/**
 * 返回RGB颜色的red分量 取值[0..1]
 */
@property (nonatomic, assign, readonly) CGFloat red;

/**
 * 返回RGB颜色的green分量 取值[0..1]
 */
@property (nonatomic, assign, readonly) CGFloat green;

/**
 * 返回RGB颜色的blue分量 取值[0..1]
 */
@property (nonatomic, assign, readonly) CGFloat blue;

/**
 * 返回RGBA颜色的alpha分量 取值[0..1]
 */
@property (nonatomic, assign, readonly) CGFloat alpha;

@end

#pragma mark - UIColor宏定义

/**
 * r g b 取值：[0 .. 1]
 */
static inline UIColor * HSColorRGB(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

/**
 * r g b  a 取值：[0 .. 1]
 */
static inline UIColor * HSColorRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

/**
 * r g b  取值：[0 .. 255]
 */
static inline UIColor * HSColorRGBExt(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorExtWithRed:r green:g blue:b];
}

/**
 * r g b  取值：[0 .. 255]  a 取值:[0 .. 1]
 */
static inline UIColor * HSColorRGBAExt(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
    return [UIColor colorExtWithRed:r green:g blue:b alpha:a];
}

/**
 * rgb整数值 例如：0x88FF78
 */
static inline UIColor * HSColorRGBValue(NSUInteger value){
    return [UIColor colorWithRGBValue:value];
}

/**
 * rgba整数值 例如：0x88FF78FF
 */
static inline UIColor * HSColorRGBAValue(NSUInteger value){
    return [UIColor colorWithRGBAValue:value];
}

/**
 * 将CSS 16进制颜色值转换为UIColor
 * 支持类型：#RGB #RGBA #RRGGBB #RRGGBBAA
 * 支持类型：0xRGB 0xRGBA 0xRRGGBB 0xRRGGBBAA
 */
static inline UIColor * HSColorHexString(NSString * hexString){
    return [UIColor colorWithHexString:hexString];
}
