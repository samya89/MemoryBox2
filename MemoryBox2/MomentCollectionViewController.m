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
@property BOOL shouldHideDeleteButton;

@end

@implementation MomentCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchWithQuery];
    self.shouldHideDeleteButton = YES;
    
    UILongPressGestureRecognizer *lpgr
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .3; //seconds
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];

    
//    NSLog(@"passed selected month and day of month = %@, %d,", self.selectedMonth, self.selectedDayOfMonth);
//    NSLog(@"query string = %@", queryString);
    
}

- (void)setselectedMonth:(id)newDetailItem {
    if (_selectedMonth != newDetailItem) {
        _selectedMonth = newDetailItem;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadDataWithoutDelete];
}

-(void)fetchWithQuery{
    NSString *queryString = [NSString stringWithFormat:@"timeString = '%@%d%@'", self.selectedBox.boxName,self.selectedDayOfMonth,self.selectedMonth.monthName];
    self.momentArray = [Moment objectsWhere:queryString];
}

-(void)reloadDataWithoutDelete{
    [self fetchWithQuery];
    self.shouldHideDeleteButton = YES;
    [self.collectionView reloadData];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // get the cell at indexPath (the one you long pressed)
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        // do stuff with the cell
        [self.collectionView reloadData];
        self.shouldHideDeleteButton = NO;
    }
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
    cell.deleteMemoryButton.tag = indexPath.row;
    cell.deleteMemoryButton.hidden = self.shouldHideDeleteButton;
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

- (IBAction)deleteMemory:(UIButton *)sender {
    Moment *moment = [self.momentArray objectAtIndex:self.selectedIndexPath.row];
    [self deleteObject:moment];
    [self reloadDataWithoutDelete];
    //    NSLog(@"%ld", sender.tag);
}

- (void)deleteObject:(RLMObject *)object{
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    Moment *moment = [self.momentArray objectAtIndex:self.selectedIndexPath.row];
    [defaultRealm beginWriteTransaction];
    [defaultRealm deleteObject:moment];
    [defaultRealm commitWriteTransaction];
    [self reloadDataWithoutDelete];
}


@end
