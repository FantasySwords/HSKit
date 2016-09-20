//
//  ViewController.m
//  HSKit
//
//  Created by 东电创新 on 16/9/13.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "ViewController.h"
#import "HSKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate * date = [NSDate dateWithYear:2016 month:9 day:17 hour:14 minute:16 second:00];
    date = [NSDate dateYesterday];
    NSLog(@"%ld %ld %ld %ld %ld %ld", date.year, date.month, date.day, date.hour, date.minute, date.second);
    
    
    UILabel * label = [UILabel label].hs_frame(CGRectMake(0, 0, 100, 100))
    .hs_font([UIFont systemFontOfSize:15])
    .hs_textColor([UIColor purpleColor])
    .hs_numberOfLines(0)
    .hs_backgroundColor([UIColor lightGrayColor]);
    
    label.hs_text(@"你好");
   
    [self.view addSubview:label];
    
    UIButton * button = [UIButton button].hs_frame(CGRectMake(0, 200, 100, 100)).hs_backgroundColor([UIColor lightGrayColor]).hs_setTitle(@"按钮", UIControlStateNormal);
    
    [self.view addSubview:button];
    
    //[button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button setTitleColorExt:[UIColor blueColor] forState:HSControlStateMaskHighlighted | HSControlStateMaskNormal];
    
    [button addActionForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        NSLog(@"1");
    }];
    
    NSLog(@"%@",button.allTargets);
    
    
    [button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchDragInside];
    
  
   
}

- (void)clicked
{
    NSLog(@"2");
}

- (void)move{
    NSLog(@"3");
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
