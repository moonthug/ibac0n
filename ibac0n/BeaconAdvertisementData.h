//
//  BeaconAdvertisementData.h
//  ibac0n
//
//  Created by m00nthug on 09/02/2015.
//  Copyright (c) 2015 m00nthug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeaconAdvertisementData : NSObject

@property (strong,nonatomic) NSUUID *proximityUUID;
@property (assign,nonatomic) uint16_t major;
@property (assign,nonatomic) uint16_t minor;
@property (assign,nonatomic) int8_t measuredPower;

- (id)initWithProximityUUID:(NSUUID *)proximityUUID
                      major:(uint16_t)major
                      minor:(uint16_t)minor
              measuredPower:(int8_t)power;

- (NSDictionary *)beaconAdvertisement;

@end
