//
//  CADisplayLink+ACY_Frames.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "CADisplayLink+ACY_Frames.h"
#import "ACYLogManager.h"
#import "ACYConstants.h"

@implementation CADisplayLink (ACY_Frames)

- (void)acy_setPreferredFramesPerSecond:(NSInteger)frames {
    
    if (frames > 60) {
        DDLogWarn(@"CAN NOT SET FRAMES PER SECOND > 60, NOW RESET IT TO 60 FRAMES PER SECOND");
        frames = 60;
    }
    

    if (ACY_ABOVE_IOS_10_0) {
        self.preferredFramesPerSecond = frames;
        DDLogDebug(@"Using the [CADisplayLink setPreferredFramesPerSecond:];");
    }
    else {
        self.frameInterval = 60 / frames;
        DDLogDebug(@"Using the [CADisplayLink setFrameInterval:];");
    }
}


@end
