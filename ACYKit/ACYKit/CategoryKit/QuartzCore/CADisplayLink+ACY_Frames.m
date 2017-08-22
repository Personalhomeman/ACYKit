//
//  CADisplayLink+ACY_Frames.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "CADisplayLink+ACY_Frames.h"
#import "ACYServiceLog.h"
#import "ACYConstants.h"

@implementation CADisplayLink (ACY_Frames)

- (void)acy_setPreferredFramesPerSecond:(NSInteger)frames {
    
    if (frames > 60) {
        DDLogWarn(@"CAN NOT SET FRAMES PER SECOND > 60, NOW RESET IT TO 60 FRAMES PER SECOND");
        frames = 60;
    }
    

    if (ACY_IOS_10) {
        self.preferredFramesPerSecond = frames;
        DDLogDebug(@"Using ios 10 api: [CADisplayLink setPreferredFramesPerSecond:];");
    }
    else {
        self.frameInterval = 60 / frames;
        DDLogDebug(@"Using ios 9 api: [CADisplayLink setFrameInterval:];");
    }
}


@end
