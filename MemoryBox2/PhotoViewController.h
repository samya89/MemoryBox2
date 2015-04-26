//
//  PhotoViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/25/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController

@property (nonatomic, strong) NSArray *photos;  // array of ALAsset objects

@property NSUInteger pageIndex;

+ (PhotoViewController *)photoViewControllerForPageIndex:(NSUInteger)pageIndex;

@end
