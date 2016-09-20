//
//  HSBlockTarget.m
//  HSKit
//
//  Created by 东电创新 on 16/9/20.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "HSBlockTarget.h"

@implementation HSBlockTarget

- (instancetype)initWithBlock:(void(^)(id))block events:(NSUInteger)events;
{
    if (self = [super init]) {
        self.block = block;
        self.events = events;
    }
    return self;
}

- (void)invoke:(id)sender
{
    if (_block) {
        _block(sender);
    }
}

@end
