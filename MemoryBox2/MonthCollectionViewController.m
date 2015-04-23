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
#import "Month.h"

@interface MonthCollectionViewController ()

@property (nonatomic, strong) RLMResults *monthArray;
@property (nonatomic, strong) RLMNotificationToken *notification;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation MonthCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    march.monthName = @"march";
    april.monthName = @"april";
    may.monthName = @"may";
    june.monthName = @"june";
    july.monthName = @"july";
    august.monthName = @"august";
    september.monthName = @"september";
    october.monthName = @"october";
    september.monthName = @"september";
    october.monthName = @"october";
    november.monthName = @"november";
    december.monthName = @"december";

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
