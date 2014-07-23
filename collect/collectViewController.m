//
//  collectViewController.m
//  collect
//
//  Created by 渡邉 雄作 on 6/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "collectViewController.h"
#import "TimesSquare.h"
#import "CheckedDay.h"

@interface collectViewController ()

@end

@implementation collectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mainViewReturnActionForSegue: (UIStoryboardSegue *)segue
{
    
}
- (IBAction)onCheck:(id)sender {
    //debug用データ投入
//    NSDateComponents *dateComp = [[NSDateComponents alloc] init];
//    for (int i = 0; i < 8; i++) {
//        [dateComp setDay:i];
//        NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComp toDate:[NSDate date] options:0];
//        CheckedDay *cd = [CheckedDay MR_createEntity];
//        cd.checkeddate = date;
//        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
//    }
    
    
    
    NSDate *today = [NSDate date];
    
    NSArray *checkedDays = [CheckedDay MR_findAll];
    for (CheckedDay *d in checkedDays) {
        NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
        [inputDateFormatter setDateFormat:@"yyyyMMdd"];
        
        if([[inputDateFormatter stringFromDate:d.checkeddate] isEqualToString:[inputDateFormatter stringFromDate:today]]) {
            NSLog(@"today's collect is already done");
            return;
        }
    }
    
    CheckedDay *cd = [CheckedDay MR_createEntity];
    cd.checkeddate = today;
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
@end
