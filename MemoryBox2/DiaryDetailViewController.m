//
//  DiaryDetailViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/27/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "DiaryDetailViewController.h"

@interface DiaryDetailViewController ()

@property (nonatomic, strong) RLMResults *momentArray;

@end

@implementation DiaryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.diaryTitle.text = self.diaryDetail.diaryNote;
    self.diaryDetailTextview.text = self.diaryDetail.diaryText;
}

@end
