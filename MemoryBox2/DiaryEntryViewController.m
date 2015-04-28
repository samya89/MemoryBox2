//
//  DiaryEntryViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "DiaryEntryViewController.h"
#import "AddDiaryNoteViewController.h"

@interface DiaryEntryViewController ()

@end

@implementation DiaryEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"int type and string = %@ %d", self.diaryEntryTimeString, self.diaryEntryType);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addDiaryNote"]) {
        NSString *diaryEntryText = self.diaryTextView.text;
        [[segue destinationViewController] setInputText:diaryEntryText];
        [[segue destinationViewController] setDiaryNoteType:self.diaryEntryType];
        [[segue destinationViewController] setDiaryNoteTimeString:self.diaryEntryTimeString];
    }
}




@end
