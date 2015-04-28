//
//  MomentCollectionViewCell.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomentCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *momentIconImage;

@property (weak, nonatomic) IBOutlet UILabel *momentNoteLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteMemoryButton;

@property (weak, nonatomic) IBOutlet UIView *momentBaseView;

- (void)jiggleMomentWithCompletionDelegate:(id)delegate;


@end
