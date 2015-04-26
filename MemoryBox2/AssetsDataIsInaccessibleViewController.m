//
//  AssetsDataIsInaccessibleViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/25/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "AssetsDataIsInaccessibleViewController.h"

@interface AssetsDataIsInaccessibleViewController ()
@property (nonatomic, strong) IBOutlet UITextView *explanationTextView;
@end

@implementation AssetsDataIsInaccessibleViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.explanationTextView.text = self.explanation;
}

@end
