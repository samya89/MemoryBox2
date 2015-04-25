//
//  DiaryEntryViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "DiaryEntryViewController.h"

@interface DiaryEntryViewController ()

@end

@implementation DiaryEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addDiary"]) {
//        [[segue destinationViewController] setSelectedMonth:self.monthItem];
//        [[segue destinationViewController] setSelectedDayOfMonth:(int)self.selectedIndexPath.row+1];
//        [[segue destinationViewController] setSelectedBox:self.boxItem];
}


- (IBAction)addDiaryEntry:(UIButton *)sender {
}

- (IBAction)cancelEntry:(UIButton *)sender {
}
@end
