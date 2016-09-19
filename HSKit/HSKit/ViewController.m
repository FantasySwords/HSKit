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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
