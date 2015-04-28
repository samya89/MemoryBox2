//
//  MomentCollectionViewCell.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "MomentCollectionViewCell.h"

@implementation MomentCollectionViewCell

- (void)jiggleMomentWithCompletionDelegate:(id)delegate{
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = @(-1*M_PI * 0.05);
    rotateAnimation.toValue = @(M_PI * 0.05);
    rotateAnimation.duration = 0.1;
    rotateAnimation.repeatCount = 50;
    rotateAnimation.autoreverses = YES;
    rotateAnimation.delegate = delegate;
    
    [self.momentBaseView.layer addAnimation:rotateAnimation forKey:rotateAnimation.keyPath];
    
}



@end
