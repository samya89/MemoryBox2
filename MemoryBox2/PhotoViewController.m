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
    
    self.photoImageView.hidden = YES;
    self.photoTitleTextfield.hidden = YES;
    self.addPhotoButton.hidden = YES;
    self.cancelPhotoButton.hidden = YES;

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
        self.photoImageView.hidden = NO;
        self.photoTitleTextfield.hidden = NO;
        self.addPhotoButton.hidden = NO;
        self.cancelPhotoButton.hidden = NO;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    self.selectedPhoto = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if ([picker sourceType] == UIImagePickerControllerSourceTypeCamera) {
        // Do something with an image from the camera
        UIImageWriteToSavedPhotosAlbum(self.selectedPhoto, nil, nil, nil);
    }
    
    [self.photoImageView setContentMode:UIViewContentModeScaleAspectFit];
    self.photoImageView.image = self.selectedPhoto;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)addPhoto:(UIButton *)sender{
    UIImage *photo = self.selectedPhoto;
    NSData *selectedPhotoData = [NSData dataWithData:UIImagePNGRepresentation(photo)];
    NSString *photoTitleText = self.photoTitleTextfield.text;
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    [defaultRealm addObject:[[Moment alloc]initWithTimeString:self.photoTimeString andType:self.photoType andDiaryText:@"" andDiaryNote:@"" andPhotoImage:selectedPhotoData andPhotoNote:photoTitleText andMapNote:@""]];
    [defaultRealm commitWriteTransaction];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.photoTitleTextfield setText:@""];
}

@end
