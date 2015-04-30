//
//  MapDetailViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "MapDetailViewController.h"

@interface MapDetailViewController ()

@end

@implementation MapDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapNoteLabel.text = self.mapDetail.mapNote;
    self.mapDetailImageView.image = [UIImage imageNamed:@"mapDetail.png"];
    
}



@end
