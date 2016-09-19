//
//  NSDate+HSKit.m
//  HSKit
//
//  Created by 东电创新 on 16/9/18.
//  Copyright © 2016年 Jerry Ho. All rights reserved.
//

#import "NSDate+HSKit.h"

@implementation NSDate (HSKit)

//In seconds
static const long long HS_MINUTE_UNIT = 60;
static const long long HS_HOUR_UNIT =   3600;
static const long long HS_DAY_UNIT =    86400;
static const long long HS_WEEK_UNIT =   604800;

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *systemTimeZone = [NSTimeZone systemTimeZone];
    
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setCalendar:gregorian];
    [dateComps setYear:year];
    [dateComps setMonth:month];
    [dateComps setDay:day];
    
    [dateComps setTimeZone:systemTimeZone];
    [dateComps setHour:hour];
    [dateComps setMinute:minute];
    [dateComps setSecond:second];
    
    return [dateComps date];
}

#pragma mark - Adjust Date

- (NSDate *)dateAdjustWithSeconds:(NSInteger)seconds{
    NSTimeInterval interval = [self timeIntervalSince1970];
    return [NSDate dateWithTimeIntervalSince1970:interval + seconds];
}

- (NSDate *)dateAdjustWithDays:(NSInteger)days{
    return [self dateAdjustWithSeconds:days * HS_DAY_UNIT];
}

- (NSDate *)dateAdjustWithHours:(NSInteger)hours{
    return [self dateAdjustWithSeconds:hours * HS_HOUR_UNIT];
}

- (NSDate *)dateAdjustWithMinutes:(NSInteger)minutes{
    return [self dateAdjustWithSeconds:minutes * HS_MINUTE_UNIT];
}

+ (NSDate *)dateTomorrow
{
    return [[NSDate date] dateAdjustWithDays:1];
}

+ (NSDate *)dateYesterday
{
    return [[NSDate date] dateAdjustWithDays:-1];
}


#pragma mark - Components
-(NSInteger)year{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    return [dateComps year];
}

- (NSInteger)month{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    return [dateComps month];
}

- (NSInteger)day{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    return [dateComps day];
}

- (NSInteger)hour{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    return [dateComps hour];
}

- (NSInteger)minute{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    return [dateComps minute];
}

- (NSInteger)second{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    return [dateComps second];
}

- (NSInteger)weekday{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:(NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSWeekdayOrdinalCalendarUnit) fromDate:self];
    return dateComps.weekday;
}

- (NSInteger)weekOfYear{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:(NSWeekCalendarUnit|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekOfMonth) fromDate:self];
    return dateComps.weekOfYear;
}

- (NSInteger)weekOfMonth{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:(NSWeekCalendarUnit|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekOfMonth) fromDate:self];
    return dateComps.weekOfMonth;
}


- (BOOL)isEqualToDateWithoutTime:(NSDate *)aDate{
    NSDateComponents * dateComps =  [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:self];
    NSDateComponents * aDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:aDate];
    
    return ((dateComps.year == aDateComps.year) && (dateComps.month == aDateComps.month) && (dateComps.day == aDateComps.day));
}

- (BOOL)isToday{
    return [self isEqualToDateWithoutTime:[NSDate date]];
}

- (BOOL)isTomorrow{
    return [self isEqualToDateWithoutTime:[NSDate dateTomorrow]];
}

- (BOOL)isYesterday{
    return [self isEqualToDateWithoutTime:[NSDate dateYesterday]];
}

- (BOOL)isSameWeekWithDate:(NSDate *)aDate{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:(NSWeekCalendarUnit|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekOfMonth) fromDate:self];
    
    NSDateComponents * aDateComps = [[NSCalendar currentCalendar] components:(NSWeekCalendarUnit|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekOfMonth) fromDate:aDate];
    
    return (dateComps.week == aDateComps.week &&  ABS([self timeIntervalSinceDate:aDate]) < HS_WEEK_UNIT);
}


- (BOOL)isThisWeek{
    return [self isSameWeekWithDate:[NSDate date]];
}
- (BOOL)isNextWeek{
    NSTimeInterval aInterval = [[NSDate date] timeIntervalSinceReferenceDate] + HS_WEEK_UNIT;
    NSDate * nextWeekDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aInterval];
    return [self isSameWeekWithDate:nextWeekDate];
}

- (BOOL)isLastWeek{
    NSTimeInterval aInterval = [[NSDate date] timeIntervalSinceReferenceDate] - HS_WEEK_UNIT;
    NSDate * lastWeekDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aInterval];
    return [self isSameWeekWithDate:lastWeekDate];
}

- (BOOL)isSameMonthWithDate:(NSDate *)aDate{
     NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:self];
     NSDateComponents * aDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:aDate];
    return (dateComps.month == aDateComps.month && dateComps.year ==  aDateComps.year);
}

- (BOOL)isThisMonth{
    return [self isSameMonthWithDate:[NSDate date]];
}

- (BOOL)isSameYearWithDate:(NSDate *)aDate{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents * aDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:aDate];
    return (dateComps.year ==  aDateComps.year);
}

- (BOOL)isThisYear{
    return [self isSameYearWithDate:[NSDate date]];
}


- (BOOL)isNextYear{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents * aDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
    return (dateComps.year ==  (aDateComps.year + 1));
}

- (BOOL)isLastYear{
    NSDateComponents * dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents * aDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
    return (dateComps.year ==  (aDateComps.year - 1));
}


- (BOOL) isEarlierThanDate: (NSDate *) aDate{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) isLaterThanDate: (NSDate *) aDate{
    return ([self compare:aDate] == NSOrderedDescending);
}

- (BOOL) isInFuture{
    return ([self isLaterThanDate:[NSDate date]]);
}

- (BOOL) isInPast{
    return ([self isEarlierThanDate:[NSDate date]]);
}

@end
