//
//  AppDelegate.m
//  ibac0n
//
//  Created by Alex Coulcher on 09/02/2015.
//  Copyright (c) 2015 m00nthug. All rights reserved.
//

#import "AppDelegate.h"

#import <IOBluetooth/IOBluetooth.h>

#import "BeaconAdvertisementData.h"

@interface AppDelegate () <CBPeripheralManagerDelegate>

@property (nonatomic,strong) CBPeripheralManager *manager;

@end

@implementation AppDelegate

- (void) setupWithUUID:(NSString *)uuid
                 major:(uint16_t)major
                 minor:(uint16_t)minor
                 power:(int8_t)power {
    
    _manager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                       queue:nil];
    
    self.beacon_uuid    = uuid;
    self.beacon_major_v = major;
    self.beacon_minor_v = minor;
    self.beacon_power   = power;
}

- (void) peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        [self start];
    }
}

- (void) start {
    if (_manager.isAdvertising) {
        [_manager stopAdvertising];
        NSLog(@"Stop Advertising!");
    }
    else {
        NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString: self.beacon_uuid];
        BeaconAdvertisementData *beaconData = [[BeaconAdvertisementData alloc] initWithProximityUUID:proximityUUID
                                                                                               major:self.beacon_major_v
                                                                                               minor:self.beacon_minor_v
                                                                                       measuredPower:self.beacon_power];
        [_manager startAdvertising:beaconData.beaconAdvertisement];
        
        NSLog(@"Started Advertising\nUUID: %@\nMajor: %hu\nMinor: %hu\nPower: %hhd", self.beacon_uuid, self.beacon_major_v, self.beacon_minor_v, self.beacon_power);
    }
}

@end
