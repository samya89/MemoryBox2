//
//  Moment.m
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "Moment.h"

@implementation Moment

- (id)initWithTimeString:(NSString *)timeString andType:(momentType)type andDiaryText:(NSString *)diaryText andDiaryNote:(NSString *)diaryNote andPhotoImage:(NSData *)photoImageData andPhotoNote:(NSString *)photoNote{
    self = [super init];
    if (self) {
        self.timeString = timeString;
        self.type = type;
        self.diaryText = diaryText;
        self.diaryNote = diaryNote;
        self.photoImageData = photoImageData;
        self.photoNote = photoNote;
    }
    return self;
}


@end
