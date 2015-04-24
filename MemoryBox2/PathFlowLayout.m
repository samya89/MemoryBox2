//
//  PathFlowLayout.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "PathFlowLayout.h"

@implementation PathFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributesInRect = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *cellAttributes in attributesInRect) {
        if (cellAttributes.indexPath.row % 2 != 0) {
            CGRect newFrame = CGRectMake(
                                         cellAttributes.frame.origin.x, // x coordinate
                                         cellAttributes.frame.origin.y + (cellAttributes.frame.size.height / 4), // y coordinate
                                         cellAttributes.frame.size.width,
                                         cellAttributes.frame.size.height
                                         );
            
            cellAttributes.frame = newFrame;
        }
        else {
            CGRect newFrame = CGRectMake(
                                         cellAttributes.frame.origin.x, // x coordinate
                                         cellAttributes.frame.origin.y - (cellAttributes.frame.size.height / 4), // y coordinate
                                         cellAttributes.frame.size.width,
                                         cellAttributes.frame.size.height
                                         );
            
            cellAttributes.frame = newFrame;
        }
    }
    return attributesInRect;
}

@end
