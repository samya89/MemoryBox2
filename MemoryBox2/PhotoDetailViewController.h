//
//  PhotoDetailViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moment.h"

@interface PhotoDetailViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *photoDetailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *photoDetailImage;

@property (strong, nonatomic) Moment *photoDetail;

@end
