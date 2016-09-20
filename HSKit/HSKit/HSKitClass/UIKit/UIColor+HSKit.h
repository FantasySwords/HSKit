//
//  UIColor+HSKit.h
//  HSKit
//
//  Created by 东电创新 on 16/9/20.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>


static inline UIColor * HS_RGB(CGFloat r, CGFloat g, CGFloat b){
    return nil;
}

static inline UIColor * HS_RGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
    return nil;
}

static inline UIColor * HSColorHex(NSUInteger value){
    return nil;
}

static inline UIColor * HSColorHexString(NSString * hexString){
    return nil;
}


@interface UIColor (HSKit)


+(UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+(UIColor *)colorExtWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+(UIColor *)colorExtWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@property (nonatomic, assign, readonly) CGFloat red;
@property (nonatomic, assign, readonly) CGFloat green;
@property (nonatomic, assign, readonly) CGFloat blue;

@end
