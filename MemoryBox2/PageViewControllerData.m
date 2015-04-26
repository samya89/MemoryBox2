//
//  PageViewControllerData.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/25/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "PageViewControllerData.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation PageViewControllerData

+ (PageViewControllerData *)sharedInstance
{
    static dispatch_once_t onceToken;
    static PageViewControllerData *sSharedInstance;
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[PageViewControllerData alloc] init];
    });
    return sSharedInstance;
}

- (NSUInteger)photoCount
{
    return self.photoAssets.count;
}

- (UIImage *)photoAtIndex:(NSUInteger)index
{
    ALAsset *photoAsset = self.photoAssets[index];
    
    ALAssetRepresentation *assetRepresentation = [photoAsset defaultRepresentation];
    
    UIImage *fullScreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]
                                                   scale:[assetRepresentation scale]
                                             orientation:ALAssetOrientationUp];
    return fullScreenImage;
}

@end

