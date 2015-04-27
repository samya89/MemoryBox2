//
//  AddMomentViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "AddMomentViewController.h"

@interface AddMomentViewController ()

@end

@implementation AddMomentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"datestamp string = %@", self.addMomentTimeString);
}

- (void)setAddMomentTimeString:(id)newDetailItem {
    if (_addMomentTimeString != newDetailItem) {
        _addMomentTimeString = newDetailItem;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}






@end
