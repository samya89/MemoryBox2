//
//  MonthCollectionViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthCollectionViewController.h"
#import "MonthCollectionViewCell.h"
#import "DetailMonthCollectionViewController.h"
#import "Month.h"
#import "CoverFlowLayout.h"

@interface MonthCollectionViewController ()

@property (nonatomic, strong) CoverFlowLayout *coverFlowLayout;
@property (nonatomic, strong) RLMResults *monthArray;
@property (nonatomic, strong) RLMNotificationToken *notification;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation MonthCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//        RLMRealm *defaultRealm = [RLMRealm defaultRealm];
//        [defaultRealm beginWriteTransaction];
//        [defaultRealm deleteAllObjects];
//        [defaultRealm commitWriteTransaction];
//    
    Month *january = [[Month alloc] init];
    Month *february = [[Month alloc] init];
    Month *march = [[Month alloc] init];
    Month *april = [[Month alloc] init];
    Month *may = [[Month alloc] init];
    Month *june = [[Month alloc] init];
    Month *july = [[Month alloc] init];
    Month *august = [[Month alloc] init];
    Month *september = [[Month alloc] init];
    Month *october = [[Month alloc] init];
    Month *november = [[Month alloc] init];
    Month *december = [[Month alloc] init];
    
    january.monthName = @"January";
    february.monthName = @"February";
    march.monthName = @"March";
    april.monthName = @"April";
    may.monthName = @"May";
    june.monthName = @"June";
    july.monthName = @"July";
    august.monthName = @"August";
    september.monthName = @"September";
    october.monthName = @"October";
    september.monthName = @"September";
    october.monthName = @"October";
    november.monthName = @"November";
    december.monthName = @"December";
    
    january.days = 31;
    february.days = 28;
    march.days = 31;
    april.days = 30;
    may.days = 31;
    june.days = 30;
    july.days = 31;
    august.days = 31;
    september.days = 30;
    october.days = 31;
    september.days = 30;
    october.days = 31;
    november.days = 30;
    december.days = 31;

    self.monthArray = [Month allObjects];
    
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    [defaultRealm addObject:january];
    [defaultRealm addObject:february];
    [defaultRealm addObject:march];
    [defaultRealm addObject:april];
    [defaultRealm addObject:may];
    [defaultRealm addObject:june];
    [defaultRealm addObject:july];
    [defaultRealm addObject:august];
    [defaultRealm addObject:september];
    [defaultRealm addObject:october];
    [defaultRealm addObject:november];
    [defaultRealm addObject:december];
    [defaultRealm commitWriteTransaction];
    
}

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.collectionView reloadData];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"monthDetail"]) {
        Month *month = [self.monthArray objectAtIndex:self.selectedIndexPath.row];
        NSLog(@"selected month = %@", month);
        NSLog(@"selected box %@", self.detailItem);
        [[segue destinationViewController] setMonthItem:month];
        [[segue destinationViewController] setBoxItem:self.detailItem];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.monthArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MonthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Month *month = self.monthArray[indexPath.row];
    cell.monthLabel.text = [month monthName];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"monthDetail" sender:self];
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
