//
//  DayCollectionViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Month.h"

@interface MomentCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Month *selectedMonth;
@property (assign, nonatomic) int selectedDayOfMonth;

- (IBAction)addMoment:(id)sender;

@end