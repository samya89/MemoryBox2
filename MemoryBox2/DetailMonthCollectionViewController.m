//
//  DetailMonthCollectionViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "DetailMonthCollectionViewController.h"
#import "MomentCollectionViewController.h"
#import "DetailMonthCollectionViewCell.h"
#import "Month.h"

@interface DetailMonthCollectionViewController ()

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation DetailMonthCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *monthName = self.monthItem.monthName;
    
    if ([monthName isEqualToString:@"January"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:27.0/255.0 green:66.0/255.0 blue:109.0/255.0 alpha:1];
    }
    
    ((UICollectionViewFlowLayout *)self.collectionViewLayout).minimumInteritemSpacing = CGFLOAT_MAX;
}

- (void)setMonthItem:(id)newDetailItem {
    if (_monthItem != newDetailItem) {
        _monthItem = newDetailItem;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"dayDetail"]) {
        NSLog(@"selected month = %@", self.monthItem);
        NSLog(@"selected box = %@", self.boxItem);
        [[segue destinationViewController] setSelectedMonth:self.monthItem];
        [[segue destinationViewController] setSelectedDayOfMonth:(int)self.selectedIndexPath.row+1];
        [[segue destinationViewController] setSelectedBox:self.boxItem];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger days = self.monthItem.days;
    return days;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailMonthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    int dayNumber = (int)indexPath.row+1;
    NSLog(@"selected day number %d", dayNumber);
    cell.dayNumberLabel.text = [NSString stringWithFormat:@"%d", dayNumber];
    
    NSString *monthName = self.monthItem.monthName;
    if ([monthName isEqualToString:@"January"]) {
    cell.dayNumberLabel.textColor = [UIColor colorWithRed:27.0/255.0 green:66.0/255.0 blue:109.0/255.0 alpha:1];
    }
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"dayDetail" sender:self];
    NSLog(@"selected date = %@, %ld", self.monthItem,indexPath.row+1);
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
