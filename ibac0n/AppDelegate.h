//
//  AppDelegate.h
//  unlock
//
//  Created by Alex Coulcher on 09/02/2015.
//  Copyright (c) 2015 m00nthug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDelegate : NSObject

@property NSString * beacon_uuid;
@property uint16_t beacon_minor_v;
@property uint16_t beacon_major_v;
@property int8_t beacon_power;

- (void) setupWithUUID:(NSString *)uuid
         major:(uint16_t)major
         minor:(uint16_t)minor
         power:(int8_t)power;
@end
