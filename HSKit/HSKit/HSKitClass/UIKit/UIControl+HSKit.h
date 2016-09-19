//
//  UIControl+HSKit.h
//  HSKit
//
//  Created by hejianyuan on 2016/9/19.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, HSControlStateMask) {
    HSControlStateMaskNormal       = 1 << 0,
    HSControlStateMaskHighlighted  = 1 << 1,
    HSControlStateMaskDisabled     = 1 << 2,
    HSControlStateMaskSelected     = 1 << 3,
    HSControlStateFocused NS_ENUM_AVAILABLE_IOS(9_0) = 1 << 4
};


@interface UIControl (HSKit)

@end
