//
//  Moment.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "Moment.h"

@implementation Moment

- (id)initWithTimeString:(NSString *)timeString{
    self = [super init];
    if (self) {
        self.timeString = timeString;
    }
    return self;
}


@end
