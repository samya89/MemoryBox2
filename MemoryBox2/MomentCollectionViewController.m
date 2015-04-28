//
//  DayCollectionViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "MomentCollectionViewController.h"
#import "MomentCollectionViewCell.h"
#import "AddMomentViewController.h"
#import "DiaryDetailViewController.h"

@interface MomentCollectionViewController ()

@property (nonatomic, strong) RLMResults *momentArray;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation MomentCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *queryString = [NSString stringWithFormat:@"timeString = '%@%d%@'", self.selectedBox.boxName,self.selectedDayOfMonth,self.selectedMonth.monthName];
    self.momentArray = [Moment objectsWhere:queryString];
    
    NSLog(@"passed selected month and day of month = %@, %d,", self.selectedMonth, self.selectedDayOfMonth);
    NSLog(@"query string = %@", queryString);
}

- (void)setselectedMonth:(id)newDetailItem {
    if (_selectedMonth != newDetailItem) {
        _selectedMonth = newDetailItem;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *timeString = [NSString stringWithFormat:@"%@%d%@", self.selectedBox.boxName, self.selectedDayOfMonth,self.selectedMonth.monthName];
    if ([[segue identifier] isEqualToString:@"addMoment"]) {
        [[segue destinationViewController] setAddMomentTimeString:timeString];
        
    } else if ([[segue identifier] isEqualToString:@"diaryDetail"]) {
        Moment *selectedMoment = self.momentArray[self.selectedIndexPath.row];
        [[segue destinationViewController] setDiaryDetail:selectedMoment];
    }
    //else if [[segue identifier] isEqualToString:@"photoDetail"])
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.momentArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MomentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Moment *moment = self.momentArray[indexPath.row];
    if (moment.type == 0){
        UIImage *myImage = [UIImage imageNamed:@"diaryIcon.png"];
        NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
        cell.momentIconImage.image = [UIImage imageWithData:data];
        cell.momentNoteLabel.text = [moment diaryNote];
    }
    return cell;
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndexPath = indexPath;
    Moment *moment = self.momentArray[indexPath.row];
    if (moment.type == 0){
    [self performSegueWithIdentifier:@"diaryDetail" sender:self];
    }
}


//- (IBAction)addMoment:(id)sender {
//    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
//    
//    NSString *timeString = [NSString stringWithFormat:@"%@%d%@", self.selectedBox, self.selectedDayOfMonth,self.selectedMonth.monthName];
//    
//    [defaultRealm beginWriteTransaction];
////    [defaultRealm addObject:[[Moment alloc]initWithTimeString:timeString]];
//    [defaultRealm commitWriteTransaction];
//    
//    [self.collectionView reloadData];
//}

@end
