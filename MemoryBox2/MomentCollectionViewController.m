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
#import "PhotoDetailViewController.h"

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
    if (self.shouldHideDeleteButton == YES)
    {
        self.shouldHideDeleteButton = NO;
        [self.collectionView reloadData];
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
    else if ([[segue identifier] isEqualToString:@"photoDetail"]){
        Moment *selectedMoment = self.momentArray[self.selectedIndexPath.row];
        [[segue destinationViewController] setPhotoDetail:selectedMoment];
    }
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
    cell.deleteMemoryButton.tag = indexPath.item;
    cell.deleteMemoryButton.hidden = self.shouldHideDeleteButton;
    if (self.shouldHideDeleteButton == NO){
        [cell jiggleMomentWithCompletionDelegate:nil];
    } else {
        [cell.momentBaseView.layer removeAnimationForKey:@"transform.rotation"];
    }
    if (moment.type == 0){
        UIImage *myImage = [UIImage imageNamed:@"diaryTransparent.png"];
        NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
        cell.momentIconImage.image = [UIImage imageWithData:data];
        cell.momentNoteLabel.text = [moment diaryNote];
    } else if (moment.type == 1){
        UIImage *myImage = [UIImage imageNamed:@"cameraTransparent.png"];
        NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
        cell.momentIconImage.image = [UIImage imageWithData:data];
        cell.momentNoteLabel.text = [moment photoNote];
    } else if (moment.type == 2){
        UIImage *myImage = [UIImage imageNamed:@"mapTransparent.png"];
        NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
        cell.momentIconImage.image = [UIImage imageWithData:data];
        cell.momentNoteLabel.text = [moment mapNote];
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
    else if (moment.type == 1){
        [self performSegueWithIdentifier:@"photoDetail" sender:self];
    } else if (moment.type ==2){
        [self performSegueWithIdentifier:@"mapDetail" sender:self];
    }
}

- (IBAction)deleteMemory:(UIButton *)sender {
    NSInteger selectedIndex = sender.tag;
    Moment *moment = [self.momentArray objectAtIndex:selectedIndex];
    [self deleteObject:moment];
    [self reloadDataWithoutDelete];
    //    NSLog(@"%ld", sender.tag);
}

- (void)deleteObject:(RLMObject *)moment{
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    [defaultRealm deleteObject:moment];
    [defaultRealm commitWriteTransaction];
}

@end
