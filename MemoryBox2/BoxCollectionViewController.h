//
//  BoxCollectionViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import <QuartzCore/QuartzCore.h>
#import "Box.h"

@interface BoxCollectionViewController : UICollectionViewController<UIGestureRecognizerDelegate>

@property (nonatomic, strong) Box *box;

- (IBAction)deleteBox:(UIButton *)sender;

@end