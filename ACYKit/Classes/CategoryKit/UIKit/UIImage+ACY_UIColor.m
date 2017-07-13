//
//  UIImage+ACY_UIColor.m
//  Pods
//
//  Created by Arthur on 12/07/2017.
//
//

#import "UIImage+ACY_UIColor.h"

@implementation UIImage (ACY_UIColor)

+ (instancetype)acy_imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)acy_imageWithColors:(NSArray<UIColor *> *)colors
                               size:(CGSize)size
                      gradientStyle:(ACYGradientStyle)gradientStyle {
    
    __block NSMutableArray *CGColors = [NSMutableArray array];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [CGColors addObject:(id)obj.CGColor];
    }];
    
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace(colors.lastObject.CGColor);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge_retained CFArrayRef)CGColors, NULL);
    
    CGPoint startPoint;
    CGPoint endPoint;
    
    CGFloat w = size.width;
    CGFloat h = size.height;
    
    switch (gradientStyle) {
        case ACYGradientStyleLeftToRight: {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(w, 0);
            break;
        }
        case ACYGradientStyleTopToBottom: {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, h);
            break;
        }
        case ACYGradientStyleLeftUpToRightBottom: {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(w, h);
            break;
        }
        case ACYGradientStyleLeftBottomToRightTop: {
            startPoint = CGPointMake(0, h);
            endPoint = CGPointMake(w, 0);
            break;
        }
    }
    
    CGGradientDrawingOptions options =
    kCGGradientDrawsBeforeStartLocation |
    kCGGradientDrawsAfterEndLocation;
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, options);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // release instances
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    CFRelease(<#CFTypeRef cf#>)
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
