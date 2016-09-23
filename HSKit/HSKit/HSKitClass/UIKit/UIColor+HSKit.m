//
//  UIColor+HSKit.m
//  HSKit
//
//  Created by 东电创新 on 16/9/20.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "UIColor+HSKit.h"

static inline NSInteger hexStr2Integer(NSString * str) {
    NSUInteger aInterger = 0;
    sscanf([str UTF8String], "%lx", &aInterger);
    return aInterger;
}

@implementation UIColor (HSKit)

+ (UIColor *)randomColor{
    return [self colorExtWithRed:arc4random_uniform(256)/255.f green:arc4random_uniform(256)/255.f blue:arc4random_uniform(256)/255.f];
}

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
}

+ (UIColor *)colorExtWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

+ (UIColor *)colorExtWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1.f];
}

+ (UIColor *)colorWithRGBValue:(NSUInteger)value{
    return [UIColor colorExtWithRed:(value & 0xFF0000) >> 16
                              green:(value & 0x00FF00) >> 8
                               blue:(value & 0x0000FF)
                              alpha:1];
}

+ (UIColor *)colorWithRGBAValue:(NSUInteger)value{
    return [UIColor colorExtWithRed:(value & 0xFF000000) >> 24
                              green:(value & 0x00FF0000) >> 16
                               blue:(value & 0x0000FF00) >> 8
                              alpha:(value & 0x000000FF)];
}



+ (UIColor *)colorWithHexString:(NSString *)hexString{
    NSString * str = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
    
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    }else if([str hasPrefix:@"0x"]){
        str = [str substringFromIndex:2];
    }else {
        NSLog(@"UIColor:%@格式错误", hexString);
        return nil;
    }
    
    NSInteger len = str.length;
    
    if (len != 3 && len!=4 && len!=6 && len!=8) {
        NSLog(@"UIColor:%@格式错误", hexString);
        return nil;
    }
    
    NSInteger red = 0, gree = 0, blue = 0, alpha = 255;

    if (len < 5) {
        
        NSString * rStr = [str substringWithRange:NSMakeRange(0, 1)];
        NSString * gStr = [str substringWithRange:NSMakeRange(1, 1)];
        NSString * bStr = [str substringWithRange:NSMakeRange(2, 1)];
        //#ABC ==>#AABBCC
        red = hexStr2Integer([NSString stringWithFormat:@"%@%@", rStr, rStr]);
        gree = hexStr2Integer([NSString stringWithFormat:@"%@%@", gStr, gStr]);
        blue = hexStr2Integer([NSString stringWithFormat:@"%@%@", bStr, bStr]);
        
        //#ABCD ==>#AABBCCDD
        if (len == 4) {
            NSString * aStr = [str substringWithRange:NSMakeRange(3, 1)];
            alpha = hexStr2Integer([NSString stringWithFormat:@"%@%@", aStr, aStr]);
        }
        
    }else {
        red = hexStr2Integer([str substringWithRange:NSMakeRange(0, 2)]);
        gree = hexStr2Integer([str substringWithRange:NSMakeRange(2, 2)]);
        blue = hexStr2Integer([str substringWithRange:NSMakeRange(4, 2)]);
    
        if (len == 8) {
            alpha = hexStr2Integer([str substringWithRange:NSMakeRange(6, 2)]);
        }
    }
    
    return [UIColor colorExtWithRed:red green:gree blue:blue alpha:alpha / 255.f];
}


- (NSUInteger)rgbValue{
    CGFloat r = 0.f, g = 0.f, b = 0, a = 0.f;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    NSUInteger red = r * 255;
    NSUInteger green = g * 255;
    NSUInteger blue = b * 255;
    
    return (red << 16 | green <<8 | blue);
}

- (NSUInteger)rgbaValue{
    CGFloat r = 0.f, g = 0.f, b = 0, a = 0.f;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    NSUInteger red = r * 255;
    NSUInteger green = g * 255;
    NSUInteger blue = b * 255;
    NSUInteger alpha = a * 255;
    
    return (red << 24 | green <<16 | blue << 8 | alpha);
}

- (NSString *)rgbHexString{
    return [self hexStringWithAlpha:NO];
}

- (NSString *)rgbaHexString{
     return [self hexStringWithAlpha:YES];
}

- (NSString *)hexStringWithAlpha:(BOOL)aFlag{
    
    CGFloat r = 0.f, g = 0.f, b = 0, a = 0.f;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    NSUInteger red = r * 255;
    NSUInteger green = g * 255;
    NSUInteger blue = b * 255;
    NSUInteger alpha = a * 255;
    
    NSString * str = nil;
    
    if (aFlag) {
        str = [NSString stringWithFormat:@"#%02lx%02lx%02lx%02lx", red, green, blue, alpha];
    } else {
        str = [NSString stringWithFormat:@"#%02lx%02lx%02lx", red, green, blue];
    }
    
    return str;
}

- (CGFloat)red{
    CGFloat redValue = 0.f;
    [self getRed:&redValue green:NULL blue:NULL alpha:NULL];
    return redValue;
}

- (CGFloat)green{
    CGFloat greenValue = 0.f;
    [self getRed:NULL green:&greenValue blue:NULL alpha:NULL];
    return greenValue;
}

- (CGFloat)blue{
    CGFloat blueValue = 0.f;
    [self getRed:NULL green:NULL blue:&blueValue alpha:NULL];
    return blueValue;
}

- (CGFloat)alpha{
    CGFloat alphaValue = 0.f;
    [self getRed:NULL green:NULL blue:NULL alpha:&alphaValue];
    return alphaValue;
}



@end
