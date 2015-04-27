//
//  AddPhotoNoteViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/27/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPhotoNoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *photoNoteTextfield;

- (IBAction)addPhotoNote:(UIButton *)sender;

@end
