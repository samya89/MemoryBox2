//
//  BoxCollectionViewCell.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Box.h"

@interface BoxCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *boxImageView;
@property (weak, nonatomic) IBOutlet UILabel *boxNameLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (nonatomic, strong) Box *box;

@end
