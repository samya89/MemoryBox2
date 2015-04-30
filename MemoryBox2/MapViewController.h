//
//  MapViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moment.h"

@interface MapViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSString *mapTimeString;

@property (nonatomic, assign) int mapType;

@property (weak, nonatomic) IBOutlet UITextField *mapTextfield;

- (IBAction)addLocation:(UIButton *)sender;

@end
