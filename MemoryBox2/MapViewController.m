//
//  MapViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addLocation:(UIButton *)sender {
    UIImage *myImage = [UIImage imageNamed:@"cameraTransparent.png"];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
    NSString *mapNoteText = self.mapTextfield.text;
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    [defaultRealm addObject:[[Moment alloc]initWithTimeString:self.mapTimeString andType:self.mapType andDiaryText:@"" andDiaryNote:@"" andPhotoImage:data andPhotoNote:@"" andMapNote:mapNoteText]];
    [defaultRealm commitWriteTransaction];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.mapTextfield setText:@""];
}

@end
