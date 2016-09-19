//
//  UIAlertView+HSKit.h
//  HSKit
//
//  Created by 东电创新 on 16/9/13.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (HSKit)

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
          clickedButtonAction:(void (^)(UIAlertView * alertView, NSUInteger buttonIndex))clickedButtonAction;


@property (nonatomic, copy) void (^clickedButtonAction)(UIAlertView *, NSInteger);

@property (nonatomic, copy) void (^cancelAction)(UIAlertView *);

@property (nonatomic, copy) void (^willPresentAction)(UIAlertView *);

@property (nonatomic, copy) void (^didPresentAction)(UIAlertView *);

@property (nonatomic, copy) void (^willDismissAction)(UIAlertView *, NSInteger);

@property (nonatomic, copy) void (^didDismissAction)(UIAlertView *, NSInteger);

/**
 *  如果要使用此属性设置第一个otherButton是否可用，需要使用方法：
 * - initWithTitle: message: message delegate: delegate cancelButtonTitle: cancelButtonTitle otherButtonTitles: otherButtonTitles, ...
 */
@property (nonatomic, copy) BOOL (^shouldEnableFirstOtherButtonAction)(UIAlertView *);

@end
