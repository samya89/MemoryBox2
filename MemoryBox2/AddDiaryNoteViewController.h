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

@property (weak, nonatomic) IBOutlet UITextField *diaryNoteTextfield;

- (IBAction)addDiaryNote:(UIButton *)sender;

@end
