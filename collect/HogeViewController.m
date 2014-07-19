//
//  HogeViewController.m
//  collect
//
//  Created by 渡邉 雄作 on 7/16/14.
//  Copyright (c) 2014 渡邉 雄作. All rights reserved.
//

#import "HogeViewController.h"
#import "TimesSquare.h"



@interface HogeViewController ()

@end



@implementation HogeViewController

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
    
//    _mainLable.text = @"ほげほげ";
    
    
    //TSQCalendarView *calendarView = [[TSQCalendarView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    TSQCalendarView *calendarView = [[TSQCalendarView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    
    calendarView.rowCellClass = [TSQCalendarRowCell class];
    calendarView.firstDate = [NSDate date];
    //calendarView.lastDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 365 * 5];
    calendarView.lastDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 90];
    calendarView.pagingEnabled = YES;
    calendarView.delegate = self;
    [self.view addSubview:calendarView];
    
    


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
