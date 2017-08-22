//
//  AVAssetTrack+ACY_UIImageOrientation.h
//  Pods
//
//  Created by Arthur Liu on 2017/05/26.
//
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface AVAssetTrack (ACY_UIImageOrientation)

- (CGSize)acy_displaySize;
- (UIImageOrientation)acy_imageOrientation;


- (CGAffineTransform)acy_transformByFrame:(CGRect)frame;

/**
 Return a correct rect for cropping method.
 
 @param contentsRect Same meaning of layer.contentsRect. So the value in it is with [0, 1].
 @return A CGRect value which will be used in the crop method.
 */
- (CGRect)acy_cropRectangleByContentsRect:(CGRect)contentsRect;

@end
