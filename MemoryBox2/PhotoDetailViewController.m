//
//  PhotoDetailViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *data = self.photoDetail.photoImageData;
    UIImage *image = [UIImage imageWithData:data];
    self.photoDetailTitle.text = self.photoDetail.photoNote;
    self.photoDetailImage.image = image;
}



@end
