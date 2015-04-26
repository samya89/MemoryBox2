//
//  ImageScrollView.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/25/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ImageScrollView : UIScrollView

@property (nonatomic, strong) ALAsset *asset;
@property (nonatomic) NSUInteger index;

+ (NSUInteger)imageCount;

@end
