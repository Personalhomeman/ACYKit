//
//  NSData+ACY_CAAnimation.h
//  Pods
//
//  Created by Arthur Liu on 2017/05/28.
//
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (ACY_CAAnimation)


/**
 Create a animation for image to used in -[(CALayer *)layer addAnimation:forKey:];.
 
 @return A animation instance.
 */
- (nullable CAKeyframeAnimation *)acy_GIFAnimation;

@end

NS_ASSUME_NONNULL_END
