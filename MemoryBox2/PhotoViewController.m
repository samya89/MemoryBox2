//
//  PhotoViewController.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/25/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "PhotoViewController.h"
#import "ImageScrollView.h"
#import "PageViewControllerData.h"

@implementation PhotoViewController

+ (PhotoViewController *)photoViewControllerForPageIndex:(NSUInteger)pageIndex
{
    if (pageIndex < [[PageViewControllerData sharedInstance] photoCount])
    {
        return [[self alloc] initWithPageIndex:pageIndex];
    }
    return nil;
}

- (id)initWithPageIndex:(NSInteger)pageIndex
{
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil)
    {
        _pageIndex = pageIndex;
    }
    return self;
}

- (void)loadView
{
    // replace our view property with our custom image scroll view
    ImageScrollView *scrollView = [[ImageScrollView alloc] init];
    scrollView.index = _pageIndex;
    
    self.view = scrollView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // set the navigation bar's title to indicate which photo index we are viewing,
    // note that our parent is MyPageViewController
    //
    self.parentViewController.navigationItem.title =
    [NSString stringWithFormat:@"%@ of %@", [@(self.pageIndex+1) stringValue], [@([[PageViewControllerData sharedInstance] photoCount]) stringValue]];
}

@end

