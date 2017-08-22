//
//  UIImage+ACY_ResizableImage.m
//  Pods
//
//  Created by Arthur Qiu on 18/04/2017.
//
//

#import "UIImage+ACY_ResizableImage.h"
#import "ACYServiceLog.h"

NS_ASSUME_NONNULL_BEGIN

@implementation UIImage (ACY_ResizableImage)

+ (UIImage *)acy_resizableImageNamed:(NSString *)name
						   capInsets:(UIEdgeInsets)capInsets {
	
	UIImage *image = [UIImage imageNamed:name];
	
	NSUInteger scale = [UIScreen mainScreen].scale;
	
	// failsafe
	if (capInsets.left < 0 ||
		capInsets.right < 0 ||
		capInsets.top < 0 ||
		capInsets.bottom < 0) {
		
		DDLogError(@"%s", __PRETTY_FUNCTION__);
		DDLogWarn(@"resize image name:%@, capInsets should NOT less than 0\ncapInsets ===>%@",name, NSStringFromUIEdgeInsets(capInsets));
		
		return image;
	}
	
	
	capInsets.left = capInsets.left ?: 1;
	capInsets.right = capInsets.right ?: 1;
	capInsets.top = capInsets.top ?: 1;
	capInsets.bottom = capInsets.bottom ?: 1;
	
	
	if (capInsets.left + capInsets.right >= image.size.width ||
		capInsets.top + capInsets.bottom >= image.size.height) {
		
		DDLogError(@"%s", __PRETTY_FUNCTION__);
		DDLogWarn(@"resize image name:%@, capInsets should NOT larger than image size\ncapInsets ===>%@\nimage size===>%@",name, NSStringFromUIEdgeInsets(capInsets),@[@(image.size.width),@(image.size.height)]);
		return image;
	}
	
	
	CGFloat pixel = 1 / scale;
	
	// Get the insets right and bottom.
	capInsets.right = image.size.width - (capInsets.left + pixel);
	capInsets.bottom = image.size.height - (capInsets.top + pixel);
	
	return [image resizableImageWithCapInsets:capInsets
								 resizingMode:UIImageResizingModeStretch];
}

@end

NS_ASSUME_NONNULL_END
