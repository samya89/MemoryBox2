//
//  DetailMonthCollectionViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Box.h"
#import "Month.h"
@class MonthCollectionViewController;

@interface DetailMonthCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Month *monthItem;
@property (strong, nonatomic) Box *boxItem;

@end
