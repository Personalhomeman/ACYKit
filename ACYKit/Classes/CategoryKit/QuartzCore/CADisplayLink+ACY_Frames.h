//
//  CADisplayLink+ACY_Frames.h
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CADisplayLink (ACY_Frames)


/**
 Set the frames per second for each iOS version in one method. Because the method `-setFrameInterval` has been marked as `DEPRECATED` in iOS 10. So using this method directly whatever your iOS version. And if you set it above 60, it will still maintain the value as 60.

 @param frames The frames per second you want to set.
 */
- (void)acy_setPreferredFramesPerSecond:(NSInteger)frames;

@end
