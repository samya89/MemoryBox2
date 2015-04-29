//
//  DiaryEntryViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Moment.h"

@interface DiaryEntryViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) NSString *diaryEntryTimeString;
@property (nonatomic, assign) int diaryEntryType;

@property (weak, nonatomic) IBOutlet UITextView *diaryTextView;

@property (weak, nonatomic) IBOutlet UITextField *diaryNoteTextfield;

- (IBAction)addDiaryNote:(UIButton *)sender;

@end
