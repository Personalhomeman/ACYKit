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
//    guard let src = CGImageSourceCreateWithURL(url as CFURL, nil) else { return nil }
//    let frameCount = CGImageSourceGetCount(src)
//
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)self, nil);
    size_t frameCount = CGImageSourceGetCount(src);
    
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
//    
//    UIImageOrientation orientation = image.imageOrientation;
//    
//    CGFloat width = image.size.width;
//    CGFloat height = image.size.height;
//    
//    CGAffineTransform transform = image.acy_transformByImageOrientation;
//    
//    
//    for (size_t i=0; i<count; i++) {
    
//    // Total loop time
//    var time : Float = 0
        float time = 0;
//    
//    // Arrays
    //    var framesArray = [AnyObject]()
    //    var tempTimesArray = [NSNumber]()
    NSMutableArray *framesArray = [NSMutableArray array];
    NSMutableArray<NSNumber *> *tempTimesArray = [NSMutableArray array];
    
    //    
//    // Loop
//    for i in 0..<frameCount {
    for (NSUInteger i = 0; i < frameCount; i++) {
        
    
//        
//        // Frame default duration
//        var frameDuration : Float = 0.1;
        float frameDuration = 0.1f;
//        
//        let cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(src, i, nil)
        CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(src, i, nil);
//        guard let framePrpoerties = cfFrameProperties as? [String:AnyObject] else {return nil}
        
        NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
        
        
//        guard let gifProperties = framePrpoerties[kCGImagePropertyGIFDictionary as String] as? [String:AnyObject]
//        else { return nil }
        NSDictionary *gifProperties =
        frameProperties[(NSString*)kCGImagePropertyGIFDictionary];
        
//        // Use kCGImagePropertyGIFUnclampedDelayTime or kCGImagePropertyGIFDelayTime
//        if let delayTimeUnclampedProp = gifProperties[kCGImagePropertyGIFUnclampedDelayTime as String] as? NSNumber {
//            frameDuration = delayTimeUnclampedProp.floatValue
//        }
//        else{
//            if let delayTimeProp = gifProperties[kCGImagePropertyGIFDelayTime as String] as? NSNumber {
//                frameDuration = delayTimeProp.floatValue
//            }
//        }
        
        // Use kCGImagePropertyGIFUnclampedDelayTime or kCGImagePropertyGIFDelayTime
        NSNumber *delayTimeUnclampedProp =
        gifProperties[(NSString*)kCGImagePropertyGIFUnclampedDelayTime];
        
        if(delayTimeUnclampedProp) {
            frameDuration = [delayTimeUnclampedProp floatValue];
        }
        else {
            NSNumber *delayTimeProp =
            gifProperties[(NSString*)kCGImagePropertyGIFDelayTime];
            
            if(delayTimeProp) {
                frameDuration = [delayTimeProp floatValue];
            }
        }
//        
//        // Make sure its not too small
//        if frameDuration < 0.011 {
//            frameDuration = 0.100;
//        }
        
        // Make sure its not too small
        if (frameDuration < 0.011f){
            frameDuration = 0.100f;
        }
        
        
//        
//        // Add frame to array of frames
//        if let frame = CGImageSourceCreateImageAtIndex(src, i, nil) {
//            tempTimesArray.append(NSNumber(value: frameDuration))
//            framesArray.append(frame)
//        }
        
        [tempTimesArray addObject:[NSNumber numberWithFloat:frameDuration]];
//
        
        // Release
        CFRelease(cfFrameProperties);
        
        // Add frame to array of frames
        CGImageRef frame = CGImageSourceCreateImageAtIndex(src, i, nil);
        [framesArray addObject:(__bridge id)(frame)];
        
        // Compile total loop time
        time = time + frameDuration;
//        // Compile total loop time
//        time = time + frameDuration
//    }
    }
//
//    var timesArray = [NSNumber]()
//    var base : Float = 0
//    for duration in tempTimesArray {
//        timesArray.append(NSNumber(value: base))
//        base.add( duration.floatValue / time )
//    }
    
    NSMutableArray *timesArray = [NSMutableArray array];
    
    float base = 0;
    for (NSNumber* duration in tempTimesArray){
        
        // !!!: maybe different
        [timesArray addObject:@(base)];
        
        base = base + (duration.floatValue / time);
        
    }
//    
//    // From documentation of 'CAKeyframeAnimation':
//    // the first value in the array must be 0.0 and the last value must be 1.0.
//    // The array should have one more entry than appears in the values array.
//    // For example, if there are two values, there should be three key times.
//    timesArray.append(NSNumber(value: 1.0))
    [timesArray addObject:@(1.0)];
//    
//    // Create animation
//    let animation = CAKeyframeAnimation(keyPath: "contents")
//    
//    animation.beginTime = AVCoreAnimationBeginTimeAtZero
//    animation.duration = CFTimeInterval(time)
//    animation.repeatCount = Float.greatestFiniteMagnitude;
//    animation.isRemovedOnCompletion = false
//    animation.fillMode = kCAFillModeForwards
//    animation.values = framesArray
//    animation.keyTimes = timesArray
//    //animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//    animation.calculationMode = kCAAnimationDiscrete
//    
//    return animation;
    
    // Create animation
    CAKeyframeAnimation* animation =
    [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    
    animation.beginTime = AVCoreAnimationBeginTimeAtZero;
    animation.duration = time;
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
