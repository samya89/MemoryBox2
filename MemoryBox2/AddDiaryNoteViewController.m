//
//  AddDiaryNoteViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/24/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "AddDiaryNoteViewController.h"
#import "Realm/Realm.h"

@interface AddDiaryNoteViewController ()

@end

@implementation AddDiaryNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addDiaryNote:(UIButton *)sender {
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    
    NSString *timeString = [NSString stringWithFormat:@"%@%d%@", self.selectedBox, self.selectedDayOfMonth,self.selectedMonth.monthName];
    [defaultRealm beginWriteTransaction];
    [defaultRealm addObject:[[Moment alloc]initWithTimeString:timeString]];
    [defaultRealm commitWriteTransaction];
    
    [self.collectionView reloadData];
}
@end
