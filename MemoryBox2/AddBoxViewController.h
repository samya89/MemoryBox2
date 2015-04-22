//
//  AddBoxViewController.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
@class Box;

@interface AddBoxViewController : UIViewController

@property (strong, nonatomic) Box *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *boxNameTextfield;

- (IBAction)addBox:(id)sender;

- (IBAction)cancel:(id)sender;



@end
