//
//  BoxCollectionViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "BoxCollectionViewController.h"
#import "AddBoxViewController.h"
#import "BoxCollectionViewCell.h"
#import "UIKit/UIKit.h"

@interface BoxCollectionViewController ()

@property (nonatomic, strong) RLMResults *array;
@property (nonatomic, strong) RLMNotificationToken *notification;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property BOOL shouldHideDeleteButton;

@end

@implementation BoxCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shouldHideDeleteButton = YES;
    
    self.array = [Box allObjects];
    NSLog(@"results %@", self.array);
    
    UILongPressGestureRecognizer *lpgr
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .3; //seconds
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadDataWithoutDelete];
}

- (Box *)insertNewObject:(id)sender {
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    
    UIImage *myImage = [UIImage imageNamed:@"memoryIconDrawer.gif"];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
    Box *box = [[Box alloc] init];
    box.boxName = @"";
    box.imageData = data;
    
    [defaultRealm beginWriteTransaction];
    [defaultRealm addObject:box];
    [defaultRealm commitWriteTransaction];
    NSLog(@"Done!");

    return box;
}

-(void)reloadDataWithoutDelete{
    self.array = [Box allObjects];
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
    if ([[segue identifier] isEqualToString:@"boxDetail"]) {
        Box *box = [self.array objectAtIndex:self.indexPath.row];
        NSLog(@"selected month = %@", box);
        [[segue destinationViewController] setDetailItem:box];
    }
    else if ([[segue identifier] isEqualToString:@"addBox"]) {
        Box *box = [self insertNewObject:self];
        AddBoxViewController *addBoxVC = [segue destinationViewController];
        addBoxVC.detailItem = box;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.array count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BoxCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Box *box = self.array[indexPath.item];
    cell.boxNameLabel.text = [box boxName];
    cell.boxImageView.image = [UIImage imageWithData:[box imageData]];
    cell.deleteButton.tag = indexPath.item;
    cell.deleteButton.hidden = self.shouldHideDeleteButton;
    if (self.shouldHideDeleteButton == NO) {
        [cell jiggleWithCompletionDelegate:nil];
    }else{
        [cell.backgroundBaseView.layer removeAnimationForKey:@"transform.rotation"];
    }
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [self performSegueWithIdentifier:@"boxDetail" sender:self];
}

- (IBAction)deleteBox:(UIButton *)sender {
    NSInteger selectedIndex = sender.tag;
    Box *box = [self.array objectAtIndex:selectedIndex];
    [self deleteObject:box];
    [self reloadDataWithoutDelete];
     //    NSLog(@"%ld", sender.tag);
}

- (void)deleteObject:(RLMObject *)box{
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm beginWriteTransaction];
    [defaultRealm deleteObject:box];
    [defaultRealm commitWriteTransaction];
//    [self reloadDataWithoutDelete];
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
