//
//  Moment.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "Box.h"

typedef NS_ENUM(NSInteger, momentType) {
    DiaryEntry,
    Photo,
    MapLocation
};

@interface Moment : RLMObject

@property NSString *timeString;

@property NSString *diaryText;
@property NSString *diaryNote;

@property momentType type;

@property NSData *photoImageData;
@property NSString *photoNote;

@property NSString *mapNote;

- (id)initWithTimeString:(NSString *)timeString andType:(momentType)type andDiaryText:(NSString *)diaryText andDiaryNote:(NSString *)diaryNote andPhotoImage:(NSData *)photoImageData andPhotoNote:(NSString *)photoNote andMapNote:(NSString *)mapNote;


@end
RLM_ARRAY_TYPE(Moment)
