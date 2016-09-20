//
//  HSBlockTarget.h
//  HSKit
//
//  Created by 东电创新 on 16/9/20.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HSBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id);

@property (nonatomic, assign) NSUInteger events;

- (instancetype)initWithBlock:(void(^)(id))block events:(NSUInteger)events;

- (void)invoke:(id)sender;

@end


