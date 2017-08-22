//
//  UIImage+ACY_ImageOrientation.h
//  Pods
//
//  Created by Arthur Liu on 2017/05/26.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (ACY_ImageOrientation)

- (CGSize)acy_displaySize;

- (CGAffineTransform)acy_transformByImageOrientation;

@end
