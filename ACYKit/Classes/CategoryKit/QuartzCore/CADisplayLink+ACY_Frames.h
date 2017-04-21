//
//  CADisplayLink+ACY_Frames.h
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CADisplayLink (ACY_Frames)

- (void)acy_setPreferredFramesPerSecond:(NSInteger)frames;

@end
