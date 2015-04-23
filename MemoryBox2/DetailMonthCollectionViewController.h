//
//  DetailMonthCollectionViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MonthCollectionViewController;
@class Month;

@interface DetailMonthCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Month *monthItem;

@end
