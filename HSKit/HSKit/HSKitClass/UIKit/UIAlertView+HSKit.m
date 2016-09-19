//
//  UIAlertView+HSKit.m
//  HSKit
//
//  Created by 东电创新 on 16/9/13.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "UIAlertView+HSKit.h"
#import <objc/runtime.h>

const static NSString * HS_ALERTVIEW_CLICKEDBUTTON_KEY = @"hskit.block.clickedbutton";
const static NSString * HS_ALERTVIEW_CANCEL_KEY = @"hskit.block.cancel";
const static NSString * HS_ALERTVIEW_WILLPRESENT_KEY = @"hskit.block.willpresent";
const static NSString * HS_ALERTVIEW_DIDPRESENT_KEY = @"hskit.block.didpresent";
const static NSString * HS_ALERTVIEW_WILLDISMISS_KEY = @"hskit.block.willdismiss";
const static NSString * HS_ALERTVIEW_DIDDISMISS_KEY = @"hskit.block.diddismiss";
const static NSString * HS_ALERTVIEW_SHOULDENABLEFIRSTOTHERBUTTON_KEY = @"hskit.block.shouldenablefirstotherbutton";

@implementation UIAlertView (HSKit)

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles clickedButtonAction:(void (^)(UIAlertView * alertView, NSUInteger buttonIndex))clickedButtonAction
{
    if (self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles: nil]) {
        for (NSString * otherTitle in otherButtonTitles) {
            [self addButtonWithTitle:otherTitle];
        }
        
        objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_CLICKEDBUTTON_KEY, clickedButtonAction, OBJC_ASSOCIATION_COPY);
    }
    
    return self;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^block)(UIAlertView *, NSInteger) = self.clickedButtonAction;
    
    if (block) {
        block(self, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    void (^block)(UIAlertView *) = self.cancelAction;
    
    if (block) {
        block(self);
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    void (^block)(UIAlertView *) = self.willPresentAction;
    
    if (block) {
        block(self);
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    void (^block)(UIAlertView *) = self.didPresentAction;
    
    if (block) {
        block(self);
    }
}


- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    void (^block)(UIAlertView *, NSInteger) = self.willDismissAction;
    
    if (block) {
        block(self, buttonIndex);
    }

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    void (^block)(UIAlertView *, NSInteger) = self.didDismissAction;
    
    if (block) {
        block(self, buttonIndex);
    }
}


- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    BOOL (^block)(UIAlertView *) = self.shouldEnableFirstOtherButtonAction;
    
    if (block) {
        return block(self);
    }
    
    return YES;
}

#pragma mark - Public

//clickedButtonAction
- (void (^)(UIAlertView *, NSInteger))clickedButtonAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_CLICKEDBUTTON_KEY);
}

- (void)setClickedButtonAction:(void (^)(UIAlertView *, NSInteger))clickedButtonAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_CLICKEDBUTTON_KEY, clickedButtonAction, OBJC_ASSOCIATION_COPY);
}


//cancelAction
- (void (^)(UIAlertView *))cancelAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_CANCEL_KEY);
}

- (void)setCancelAction:(void (^)(UIAlertView *))cancelAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_CANCEL_KEY, cancelAction, OBJC_ASSOCIATION_COPY);
}


//willPresentAction
- (void (^)(UIAlertView *))willPresentAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_WILLPRESENT_KEY);
}

- (void)setWillPresentAction:(void (^)(UIAlertView *))willPresentAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_WILLPRESENT_KEY, willPresentAction, OBJC_ASSOCIATION_COPY);
}


//didPresentAction
- (void (^)(UIAlertView *))didPresentAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_DIDPRESENT_KEY);
}

- (void)setDidPresentAction:(void (^)(UIAlertView *))didPresentAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_DIDPRESENT_KEY, didPresentAction, OBJC_ASSOCIATION_COPY);
}

//willDismissAction
- (void (^)(UIAlertView *, NSInteger))willDismissAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_WILLDISMISS_KEY);
}

- (void)setWillDismissAction:(void (^)(UIAlertView *, NSInteger))willDismissAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_WILLDISMISS_KEY, willDismissAction, OBJC_ASSOCIATION_COPY);
}


//didDismissAction
- (void (^)(UIAlertView *, NSInteger))didDismissAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_DIDDISMISS_KEY);
}

- (void)setDidDismissAction:(void (^)(UIAlertView *, NSInteger))didDismissAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_DIDDISMISS_KEY, didDismissAction, OBJC_ASSOCIATION_COPY);
}

//shouldEnableFirstOtherButtonAction
- (BOOL (^)(UIAlertView *))shouldEnableFirstOtherButtonAction
{
    return objc_getAssociatedObject(self,(__bridge const void *)HS_ALERTVIEW_SHOULDENABLEFIRSTOTHERBUTTON_KEY);
}

- (void)setShouldEnableFirstOtherButtonAction:(BOOL (^)(UIAlertView *))shouldEnableFirstOtherButtonAction
{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)HS_ALERTVIEW_SHOULDENABLEFIRSTOTHERBUTTON_KEY, shouldEnableFirstOtherButtonAction, OBJC_ASSOCIATION_COPY);
}


@end
