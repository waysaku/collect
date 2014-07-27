//
//  CheckedDay.h
//  collect
//
//  Created by 渡邉 雄作 on 2014/07/28.
//  Copyright (c) 2014年 渡邉 雄作. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CheckedDay : NSManagedObject

@property (nonatomic, retain) NSDate * checkeddate;
@property (nonatomic, retain) NSString * checkedstr;

@end
