//
//  UIImage+ACY_ResizableImage.m
//  Pods
//
//  Created by Arthur Qiu on 18/04/2017.
//
//

#import "UIImage+ACY_ResizableImage.h"

NS_ASSUME_NONNULL_BEGIN

@implementation UIImage (ACY_ResizableImage)

+ (UIImage *)acy_resizableImageNamed:(NSString *)name {
	UIImage *image = [UIImage imageNamed:name];
	
	UIEdgeInsets capInsets = UIEdgeInsetsMake(image.size.height * 0.5,
											  image.size.width * 0.5,
											  image.size.height * 0.5,
											  image.size.width * 0.5);
	
	return [image resizableImageWithCapInsets:capInsets];
}

@end

NS_ASSUME_NONNULL_END
