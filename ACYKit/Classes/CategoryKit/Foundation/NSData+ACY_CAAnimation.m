//
//  NSData+ACY_CAAnimation.m
//  Pods
//
//  Created by Arthur Liu on 2017/05/28.
//
//

#import "NSData+ACY_CAAnimation.h"
#import <CoreGraphics/CoreGraphics.h>
#import <ImageIO/ImageIO.h>
#import <AVFoundation/AVFoundation.h>

@implementation NSData (ACY_CAAnimation)

- (nullable CAKeyframeAnimation *)acy_GIFAnimationWithContentsRect:(CGRect)contentsRect {
    // 1.0 Get source image
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)self, NULL);
    size_t count = CGImageSourceGetCount(source);
    
    float allTime=0;
    
    NSMutableArray * framesArray = [[NSMutableArray alloc]init];
    NSMutableArray * tempTimeArray = [[NSMutableArray alloc]init];
    
    @autoreleasepool {
        
    
    for (size_t i = 0; i < count; i++) {
        
        
        // 2.0 set image with crop rect
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
        
        CGFloat imageWidth = CGImageGetWidth(imageRef);
        CGFloat imageHeight = CGImageGetHeight(imageRef);
        
        CGFloat x = contentsRect.origin.x * imageWidth;
        CGFloat y = contentsRect.origin.y * imageHeight;
        CGFloat w = contentsRect.size.width * imageWidth;
        CGFloat h = contentsRect.size.height * imageHeight;
        
        CGRect rect = CGRectMake(x, y, w, h);
        
        
        CGImageRef cropImage = CGImageCreateWithImageInRect(imageRef, rect);
        
        [framesArray addObject:(__bridge_transfer UIImage *)(cropImage)];
        
        
        CGImageRelease(imageRef);
//        CGImageRelease(cropImage);
        
        NSDictionary * info = (__bridge_transfer NSDictionary*)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        
        NSDictionary * gifProperties = [info objectForKey:(__bridge_transfer NSString *)kCGImagePropertyGIFDictionary];
        
        
        
        
        // 2.1 calculate time
        float frameDuration = 0.1f;
        
        float delayTimeUnclampedProp = [[gifProperties objectForKey:(__bridge_transfer NSString *)kCGImagePropertyGIFUnclampedDelayTime] floatValue];
        
        if(delayTimeUnclampedProp) {
            frameDuration = delayTimeUnclampedProp;
        }
        else {
            NSNumber *delayTimeProp =
            gifProperties[(__bridge_transfer NSString *)kCGImagePropertyGIFDelayTime];
            
            if(delayTimeProp) {
                frameDuration = [delayTimeProp floatValue];
            }
        }
        
        if (frameDuration < 0.011f){
            frameDuration = 0.100f;
        }
        
        [tempTimeArray addObject:[NSNumber numberWithFloat:frameDuration]];
        
        allTime += frameDuration;
        
    }
    
    }
    
    CFRelease(source);
    
    // 3.0 Get real times value
    NSMutableArray *timesArray = [NSMutableArray array];
    
    float base = 0;
    for (NSNumber* duration in tempTimeArray){
        
        [timesArray addObject:@(base)];
        base = base + (duration.floatValue / allTime);
    }
    
    [timesArray addObject:@(1.0)];
    
    
    // 4.0 Create the animation.
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    
    animation.beginTime = AVCoreAnimationBeginTimeAtZero;
    animation.duration = allTime;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.values = framesArray;
    animation.keyTimes = timesArray;
    animation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.calculationMode = kCAAnimationDiscrete;
    
    return animation;
}

@end
