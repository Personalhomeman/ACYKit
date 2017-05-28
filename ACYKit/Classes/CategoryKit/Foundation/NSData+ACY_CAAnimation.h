//
//  NSData+ACY_CAAnimation.h
//  Pods
//
//  Created by Arthur Liu on 2017/05/28.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (ACY_CAAnimation)


/**
 Create a animation for image to used in -[(CALayer *)layer addAnimation:forKey:];.

 @param contentsRect Same meaning in layer.contentsRect. It's range is [0, 1].
 @return A animation instance.
 */
- (nullable CAKeyframeAnimation *)acy_GIFAnimationWithContentsRect:(CGRect)contentsRect;

@end

NS_ASSUME_NONNULL_END
