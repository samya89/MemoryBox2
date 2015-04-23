//
//  AddBoxViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "AddBoxViewController.h"
#import "Box.h"

@interface AddBoxViewController ()

@end

@implementation AddBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
//        [self configureView];
    }
}

//- (void)configureView {
//    if (self.detailItem) {
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addBox:(id)sender {
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    self.detailItem.boxName = self.boxNameTextfield.text;
    [defaultRealm commitWriteTransaction];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    Box *box = self.detailItem;
    [defaultRealm beginWriteTransaction];
    [defaultRealm deleteObject:box];
    [defaultRealm commitWriteTransaction];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end






