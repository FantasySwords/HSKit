//
//  NSDate+HSKit.h
//  HSKit
//
//  Created by 东电创新 on 16/9/18.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HSKit)

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

+ (NSDate *)dateTomorrow;
+ (NSDate *)dateYesterday;

/**
 *  在现有的date上增加seconds秒，返回新的date， seconds可以<0
 */
- (NSDate *)dateAdjustWithSeconds:(NSInteger)seconds;
- (NSDate *)dateAdjustWithDays:(NSInteger)days;
- (NSDate *)dateAdjustWithHours:(NSInteger)hours;
- (NSDate *)dateAdjustWithMinutes:(NSInteger)minutes;

@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;

@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger second;

/**
 *  weekday:[1..7] [Sun. .. Sat.]  [周日..周六]
 */
@property (nonatomic, assign, readonly) NSInteger weekday;
@property (nonatomic, assign, readonly) NSInteger weekOfMonth;
@property (nonatomic, assign, readonly) NSInteger weekOfYear;


- (BOOL)isEqualToDateWithoutTime:(NSDate *)aDate;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;

- (BOOL)isSameWeekWithDate:(NSDate *)aDate;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;

- (BOOL)isSameMonthWithDate:(NSDate *)aDate;
- (BOOL)isThisMonth;

- (BOOL)isSameYearWithDate:(NSDate *)aDate;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;

- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;
- (BOOL) isInFuture;
- (BOOL) isInPast;

@end
