//
//  Moment.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/23/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
@class Box;

@interface Moment : RLMObject

@property NSString *monthStamp;
@property int momentID;
@property int type;

@end
RLM_ARRAY_TYPE(Moment)
