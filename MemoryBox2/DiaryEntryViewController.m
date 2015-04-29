//
//  DiaryEntryViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "DiaryEntryViewController.h"

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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"addDiaryNote"]) {
//        NSString *diaryEntryText = self.diaryTextView.text;
//        [[segue destinationViewController] setInputText:diaryEntryText];
//        [[segue destinationViewController] setDiaryNoteType:self.diaryEntryType];
//        [[segue destinationViewController] setDiaryNoteTimeString:self.diaryEntryTimeString];
//    }
//}

- (IBAction)addDiaryNote:(UIButton *)sender {
    UIImage *myImage = [UIImage imageNamed:@"cameraIcon.png"];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
    NSString *diaryEntryText = self.diaryTextView.text;
    NSString *diaryNoteText = self.diaryNoteTextfield.text;
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    [defaultRealm addObject:[[Moment alloc]initWithTimeString:self.diaryEntryTimeString andType:self.diaryEntryType andDiaryText:diaryEntryText andDiaryNote:diaryNoteText andPhotoImage:data andPhotoNote:@"" andMapNote:@""]];
    [defaultRealm commitWriteTransaction];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.diaryNoteTextfield setText:@""];
}

@end
