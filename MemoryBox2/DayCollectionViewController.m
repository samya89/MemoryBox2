//
//  DayCollectionViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "DayCollectionViewController.h"
#import "Moment.h"

@interface DayCollectionViewController ()

@end

@implementation DayCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Moment *moment = [[Moment alloc] init];
//
//    january.monthName = @"January";
//    february.monthName = @"February";
//    march.monthName = @"March";
//    april.monthName = @"April";
//    may.monthName = @"May";
//    june.monthName = @"June";
//    july.monthName = @"July";
//    august.monthName = @"August";
//    september.monthName = @"September";
//    october.monthName = @"October";
//    september.monthName = @"September";
//    october.monthName = @"October";
//    november.monthName = @"November";
//    december.monthName = @"December";
//    
//    january.days = 31;
//    february.days = 28;
//    march.days = 31;
//    april.days = 30;
//    may.days = 31;
//    june.days = 30;
//    july.days = 31;
//    august.days = 31;
//    september.days = 30;
//    october.days = 31;
//    september.days = 30;
//    october.days = 31;
//    november.days = 30;
//    december.days = 31;
//    
//    self.monthArray = [Month allObjects];
//    
//    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
//    [defaultRealm beginWriteTransaction];
//    [defaultRealm addObject:january];
//    [defaultRealm addObject:february];
//    [defaultRealm addObject:march];
//    [defaultRealm addObject:april];
//    [defaultRealm addObject:may];
//    [defaultRealm addObject:june];
//    [defaultRealm addObject:july];
//    [defaultRealm addObject:august];
//    [defaultRealm addObject:september];
//    [defaultRealm addObject:october];
//    [defaultRealm addObject:november];
//    [defaultRealm addObject:december];
//    [defaultRealm commitWriteTransaction];
//    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
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
