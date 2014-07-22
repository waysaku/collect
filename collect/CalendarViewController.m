//
//  CalendarViewController.m
//  collect
//
//  Created by 渡邉 雄作 on 2014/07/22.
//  Copyright (c) 2014年 渡邉 雄作. All rights reserved.
//

#import "CalendarViewController.h"
#import "TimesSquare.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    TSQCalendarView *calendarView = [[TSQCalendarView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 280)];
    calendarView.calendar = self.calendar;
    calendarView.rowCellClass = [TSQCalendarRowCell class];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    
    [comps setMonth:[comps month] - 1];
    [comps setDay:1];
    calendarView.firstDate = [calendar dateFromComponents:comps];
    
    
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    [comps setMonth:[comps month] + 1];
    [comps setDay:range.length];
    calendarView.lastDate = [calendar dateFromComponents:comps];
    
    calendarView.selectedDate = [NSDate  dateWithTimeIntervalSinceNow:0.0f];
    
    calendarView.pagingEnabled = false;
    CGFloat onePixel = 1.0f / [UIScreen mainScreen].scale;
    calendarView.contentInset = UIEdgeInsetsMake(0.0f, onePixel, 0.0f, onePixel);
    
    self.view = calendarView;
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    NSDate *date = [NSDate date];
    [(TSQCalendarView *)self.view scrollToDate:date animated:false];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
