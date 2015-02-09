//
//  main.m
//  unlock
//
//  Based heavily on: https://github.com/mttrb/BeaconOSX
//
//  Created by Alex Coulcher on 09/02/2015.
//  Copyright (c) 2015 m00nthug. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    NSString *uuid;
    uint16 major;
    uint16 minor;
    int power;

    if(argc < 5) {
        NSLog(@"Generating iBeacon with random details...\nTo specify values use:\n\nibac0n <uuid> <major> <minor> <power>\n\n");

        uuid = [[NSUUID UUID] UUIDString];
        major = 1;
        minor = 1;
        power = -60;
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
        AppDelegate *app = [AppDelegate alloc];
        [app setupWithUUID:uuid
                     major:major
                     minor:minor
                     power:power];
        
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop run];
    }
    return 0;
}
