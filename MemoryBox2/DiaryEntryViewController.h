//
//  DiaryEntryViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaryEntryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *diaryTextView;

- (IBAction)addDiaryEntry:(UIButton *)sender;
- (IBAction)cancelEntry:(UIButton *)sender;

@end
