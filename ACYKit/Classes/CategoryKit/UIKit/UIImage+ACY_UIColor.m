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

@end
