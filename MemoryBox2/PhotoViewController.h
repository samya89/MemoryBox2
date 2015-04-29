//
//  PhotoViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Moment.h"

@interface PhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *photoTitleTextfield;

- (IBAction)addPhoto:(UIButton *)sender;

@property (nonatomic, strong) NSString *photoTimeString;
@property (nonatomic, assign) int photoType;
@property (nonatomic, strong) UIImage *selectedPhoto;

@end
