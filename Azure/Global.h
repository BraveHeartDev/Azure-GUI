//
//  Global.h
//  Azure
//
//  Created by Brave Heart on 7/25/14.
//  Copyright (c) 2014 iOSCheaters. All rights reserved.
//

#ifndef Azure_Global_h
#define Azure_Global_h

#define AntiARCRetain(...) void *retainedThing = (__bridge_retained void *)__VA_ARGS__; retainedThing = retainedThing
#define AntiARCRelease(...) void *retainedThing = (__bridge void *) __VA_ARGS__; id unretainedThing = (__bridge_transfer id)retainedThing; unretainedThing = nil

#endif
