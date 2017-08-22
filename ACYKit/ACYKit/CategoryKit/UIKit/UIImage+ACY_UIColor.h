//
//  UIImage+ACY_UIColor.h
//  Pods
//
//  Created by Arthur on 12/07/2017.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ACYGradientStyle) {
    ACYGradientStyleLeftToRight,
    ACYGradientStyleTopToBottom,
    ACYGradientStyleLeftUpToRightBottom,
    ACYGradientStyleLeftBottomToRightTop,
};

@interface UIImage (ACY_UIColor)

+ (instancetype)acy_imageWithColor:(UIColor *)color;

+ (instancetype)acy_imageWithColors:(NSArray<UIColor *> *)colors
                               size:(CGSize)size
                      gradientStyle:(ACYGradientStyle)gradientStyle;

@end
