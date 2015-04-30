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
    }else if ([monthName isEqualToString:@"February"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:209.0/255.0 green:67.0/255.0 blue:109.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"March"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:92.0/255.0 green:179.0/255.0 blue:52.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"April"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:99.0/255.0 blue:99.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"May"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:107.0/255.0 green:191.0/255.0 blue:116.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"June"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"July"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:207.0/255.0 blue:36.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"August"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:137.0/255.0 blue:178.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"September"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:98.0/255.0 blue:30.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"October"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:122.0/255.0 green:41.0/255.0 blue:21.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"November"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:126.0/255.0 green:164.0/255.0 blue:189.0/255.0 alpha:1.0];
    }else if ([monthName isEqualToString:@"December"]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:215.0/255.0 green:24.0/255.0 blue:47.0/255.0 alpha:1.0];
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
    } else if ([monthName isEqualToString:@"February"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:209.0/255.0 green:67.0/255.0 blue:109.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"March"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:92.0/255.0 green:179.0/255.0 blue:52.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"April"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:230.0/255.0 green:99.0/255.0 blue:99.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"May"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:107.0/255.0 green:191.0/255.0 blue:116.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"June"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:242.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"July"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:236.0/255.0 green:207.0/255.0 blue:36.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"August"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:47.0/255.0 green:137.0/255.0 blue:178.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"September"]) {
        cell.dayNumberLabel.textColor =  self.collectionView.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:98.0/255.0 blue:30.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"October"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:122.0/255.0 green:41.0/255.0 blue:21.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"November"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:126.0/255.0 green:164.0/255.0 blue:189.0/255.0 alpha:1.0];
    } else if ([monthName isEqualToString:@"December"]) {
        cell.dayNumberLabel.textColor = [UIColor colorWithRed:215.0/255.0 green:24.0/255.0 blue:47.0/255.0 alpha:1.0];
    }
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"dayDetail" sender:self];
//    NSLog(@"selected date = %@, %ld", self.monthItem,indexPath.row+1);
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
