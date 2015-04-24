//
//  Month.h
//  MemoryBox2
//
//  Created by Samia Al Rahmani on 4/22/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>

@interface Month : RLMObject

@property NSString *monthName;
@property int days; // num of days in month
//@property NSData *monthImage;

@end
RLM_ARRAY_TYPE(Month)
