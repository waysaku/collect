//
//  collectMasterViewController.h
//  collect-DEV
//
//  Created by 渡邉 雄作 on 6/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class collectDetailViewController;

@interface collectMasterViewController : UITableViewController

@property (strong, nonatomic) collectDetailViewController *detailViewController;

@end
