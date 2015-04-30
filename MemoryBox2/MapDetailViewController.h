//
//  MapDetailViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moment.h"

@interface MapDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mapNoteLabel;

@property (weak, nonatomic) IBOutlet UIImageView *mapDetailImageView;

@property (strong, nonatomic) Moment *mapDetail;

@end
