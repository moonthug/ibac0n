//
//  BeaconManager.h
//  ibac0n
//
//  Created by m00nthug on 09/02/2015.
//  Copyright (c) 2015 m00nthug. All rights reserved.
//



#include <stdio.h>

#import <Foundation/Foundation.h>

@interface BeaconManager : NSObject

@property (assign,nonatomic) NSString * beacon_uuid;
@property (assign,nonatomic) NSString * beacon_identifier;
@property (assign,nonatomic) uint16_t beacon_minor_v;
@property (assign,nonatomic) uint16_t beacon_major_v;
@property (assign,nonatomic) int8_t beacon_power;

- (void) setupWithUUID:(NSString *)uuid
                 major:(uint16_t)major
                 minor:(uint16_t)minor
                 power:(int8_t)power;
@end