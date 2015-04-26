//
//  PageViewControllerData.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/25/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PageViewControllerData : NSObject

+ (PageViewControllerData *)sharedInstance;

@property (nonatomic, strong) NSArray *photoAssets; // array of ALAsset objects

- (NSUInteger)photoCount;
- (UIImage *)photoAtIndex:(NSUInteger)index;

@end
