//
//  AddDiaryNoteViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moment.h"

@interface AddDiaryNoteViewController : UIViewController

@property (nonatomic, strong) NSString *inputText;
@property (nonatomic, assign) int diaryNoteType;
@property (nonatomic, strong) NSString *diaryNoteTimeString;

@property (weak, nonatomic) IBOutlet UITextField *diaryNoteTextfield;

- (IBAction)addDiaryNote:(UIButton *)sender;

@end
