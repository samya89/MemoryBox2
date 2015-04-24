//
//  DiaryEntry.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>

@interface DiaryEntry : RLMObject

@property NSString *text;
@property NSString *note;

+ (NSDictionary *)defaultPropertyValues;

@end
RLM_ARRAY_TYPE(DiaryEntry)