//
//  UIImage+ACY_ResizableImage.h
//  Pods
//
//  Created by Arthur Qiu on 18/04/2017.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ACY_ResizableImage)


/**
 Resize a image with given image name. And the resizingMode is UIImageResizingModeStretch. Using this method will provide the fastest performance.

 @param name The image name.
 @return A resizable image according to UIImageResizingModeStretch.
 */
+ (UIImage *)acy_resizableImageNamed:(NSString *)name
						   capInsets:(UIEdgeInsets)capInsets;

@end

NS_ASSUME_NONNULL_END
