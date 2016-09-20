//
//  UIControl+HSKit.m
//  HSKit
//
//  Created by hejianyuan on 2016/9/19.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "UIControl+HSKit.h"
#import "HSBlockTarget.h"
#import <objc/runtime.h>

const static NSString * HS_CONTROL_BLOCK_TARGETS_KEY = @"hskit.mutablearray.blocktargets";

@implementation UIControl (HSKit)

- (NSMutableArray *)hs_blockTargets
{
    NSMutableArray * blockTargets = objc_getAssociatedObject(self, (__bridge const void *)HS_CONTROL_BLOCK_TARGETS_KEY);
    if (!blockTargets) {
        blockTargets = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)HS_CONTROL_BLOCK_TARGETS_KEY, blockTargets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return blockTargets;
}


- (void)addActionForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block
{
    HSBlockTarget * target = [[HSBlockTarget alloc] initWithBlock:block events:(NSUInteger)controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    [[self hs_blockTargets] addObject:target];
}


- (void)removeBlockForControlEvents:(UIControlEvents)controlEvents
{
    NSMutableArray * willRemoveBlocks = [NSMutableArray array];
    NSMutableArray * blockTargets = [self hs_blockTargets];
    
    for (HSBlockTarget * target in blockTargets) {
        
        if (!(target.events & controlEvents)) {
            continue;
        }
        
        UIControlEvents newControlEvents = target.events & (~controlEvents);
        if (newControlEvents) {
            [self removeTarget:target action:@selector(invoke:) forControlEvents:(UIControlEvents)target.events];
            target.events = newControlEvents;
            [self addTarget:target action:@selector(invoke:) forControlEvents:newControlEvents];
        }else{
            [self removeTarget:target action:@selector(invoke:) forControlEvents:(UIControlEvents)target.events];
            [willRemoveBlocks addObject:target];
        }
    }
    
    [blockTargets removeObjectsInArray:willRemoveBlocks];
}




@end
