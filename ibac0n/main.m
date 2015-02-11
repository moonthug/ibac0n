//
//  main.m
//  ibac0n
//
//  Based heavily on: https://github.com/mttrb/BeaconOSX
//
//  Created by Alex Coulcher on 09/02/2015.
//  Copyright (c) 2015 m00nthug. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BeaconManager.h"

int main(int argc, const char * argv[]) {
    NSString *uuid;
    uint16 major;
    uint16 minor;
    int power;

    if(argc < 5) {
        NSLog(@"Ooops! Incorrect values set\n\nUsage:\n\n\tibac0n <uuid> <major> <minor> <power>\n\n");
        return 1;
    }
    else {
        uuid = [NSString stringWithUTF8String:argv[1]];
        
        NSString *majorString = [NSString stringWithUTF8String:argv[2]];
        major = [majorString integerValue];
                                
        NSString *minorString = [NSString stringWithUTF8String:argv[3]];
        minor = [minorString integerValue];
                 
        NSString *powerString = [NSString stringWithUTF8String:argv[4]];
        power = (int)[powerString integerValue];
    }
    
    @autoreleasepool {
        BeaconManager *manager = [BeaconManager alloc];
        [manager setupWithUUID:uuid
                         major:major
                         minor:minor
                         power:power];
        
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop run];
    }
    return 0;
}
