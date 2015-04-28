//
//  UIView+Animation.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/28/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (CAAnimation*)getShakeAnimation
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CGFloat wobbleAngle = 0.06f;
    
    NSValue* valLeft = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(wobbleAngle, 0.0f, 0.0f, 1.0f)];
    NSValue* valRight = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-wobbleAngle, 0.0f, 0.0f, 1.0f)];
    animation.values = [NSArray arrayWithObjects:valLeft, valRight, nil];
    
    animation.autoreverses = YES;
    animation.duration = 0.125;
    animation.repeatCount = HUGE_VALF;
    
    return animation;
}

//- (CAAnimation*)getShakeAnimation {
//    
//    CABasicAnimation *animation;
//    CATransform3D transform;
//    
//    // Create the rotation matrix
//    transform = CATransform3DMakeRotation(0.08, 0, 0, 1.0);
//    
//    // Create a basic animation to animate the layer's transform
//    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    
//    // Assign the transform as the animation's value
//    animation.toValue = [NSValue valueWithCATransform3D:transform];
//    
//    animation.autoreverses = YES;
//    animation.duration = 0.1;
//    animation.repeatCount = HUGE_VALF;
//    
//    return animation;
//    
//}

@end
