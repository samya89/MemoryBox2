//
//  PhotoViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
    NSLog(@"photo VC = %@ %d",self.photoTimeString, self.photoType);
}

- (IBAction)pressedAdd:(id)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Choose Photo" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePicker animated:YES completion:nil];
        }];
        
        [actionSheet addAction:camera];
    }
    
    UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:@"From Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    [actionSheet addAction:galleryAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel   handler:^(UIAlertAction *action) {
        
    }];
    
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if ([picker sourceType] == UIImagePickerControllerSourceTypeCamera) {
        // Do something with an image from the camera
        UIImageWriteToSavedPhotosAlbum(originalImage, nil, nil, nil);
    }
    
    [self.photoImageView setContentMode:UIViewContentModeScaleAspectFit];
    self.photoImageView.image = originalImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)addPhoto:(UIButton *)sender{
//    UIImage *myImage = [UIImage imageNamed:@"cameraIcon.png"];
//    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
//    
//    NSString *diaryNoteText = self.diaryNoteTextfield.text;
//    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
//    [defaultRealm beginWriteTransaction];
//    [defaultRealm addObject:[[Moment alloc]initWithTimeString:self.diaryNoteTimeString andType:self.diaryNoteType andDiaryText:self.inputText andDiaryNote:diaryNoteText andPhotoImage:data andPhotoNote:@""]];
//    [defaultRealm commitWriteTransaction];
    
}


@end
