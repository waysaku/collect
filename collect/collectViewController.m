//
//  collectViewController.m
//  collect
//
//  Created by 渡邉 雄作 on 6/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "collectViewController.h"
#import "TimesSquare.h"

@interface collectViewController ()

@end

@implementation collectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    TSQCalendarView *calendarView = [[TSQCalendarView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 280)];
    calendarView.calendar = self.calendar;
    calendarView.rowCellClass = [TSQCalendarRowCell class];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    [comps setDay:1];
    calendarView.firstDate = [calendar dateFromComponents:comps];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    [comps setDay:range.length];
    calendarView.lastDate = [calendar dateFromComponents:comps];
    
    calendarView.selectedDate = [NSDate  dateWithTimeIntervalSinceNow:0.0f];
    
    calendarView.pagingEnabled = false;
    CGFloat onePixel = 1.0f / [UIScreen mainScreen].scale;
    calendarView.contentInset = UIEdgeInsetsMake(0.0f, onePixel, 0.0f, onePixel);
    
    [self.view addSubview:calendarView];
    
    
    
    
    
    calendarView = [[TSQCalendarView alloc] initWithFrame:CGRectMake(0, 380, self.view.bounds.size.width, 280)];
    calendarView.calendar = self.calendar;
    calendarView.rowCellClass = [TSQCalendarRowCell class];
    
    [comps setDay:1];
    calendarView.firstDate = [calendar dateFromComponents:comps];
    
    [comps setDay:range.length];
    calendarView.lastDate = [calendar dateFromComponents:comps];
    
    calendarView.selectedDate = [NSDate  dateWithTimeIntervalSinceNow:0.0f];
    
    calendarView.contentInset = UIEdgeInsetsMake(0.0f, onePixel, 0.0f, onePixel);
    
    [self.view addSubview:calendarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mainViewReturnActionForSegue: (UIStoryboardSegue *)segue
{
    
}
@end
