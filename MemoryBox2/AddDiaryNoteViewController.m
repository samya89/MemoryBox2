//
//  AddDiaryNoteViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "AddDiaryNoteViewController.h"
#import "Realm/Realm.h"

@interface AddDiaryNoteViewController ()

@end

@implementation AddDiaryNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@" add diary note VC %@ %d %@", self.inputText, self.diaryNoteType, self.diaryNoteTimeString);

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
