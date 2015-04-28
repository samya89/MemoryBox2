//
//  DiaryDetailViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/27/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moment.h"

@interface DiaryDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *diaryTitle;
@property (weak, nonatomic) IBOutlet UITextView *diaryDetailTextview;

@property (strong, nonatomic) Moment *diaryDetail;

@end
