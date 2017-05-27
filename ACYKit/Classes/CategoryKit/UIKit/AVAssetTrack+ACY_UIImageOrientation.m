//
//  AVAssetTrack+ACY_UIImageOrientation.m
//  Pods
//
//  Created by Arthur Liu on 2017/05/26.
//
//

#import "AVAssetTrack+ACY_UIImageOrientation.h"
#import "ACYMacros.h"

@implementation AVAssetTrack (ACY_UIImageOrientation)


- (CGSize)acy_displaySize {
    
    CGSize size = self.naturalSize;
    
    return [self acy_displayPortrait] ?
    CGSizeMake(size.height, size.width) :
    size;
    
}


- (BOOL)acy_displayPortrait {
    switch ([self acy_imageOrientation]) {
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored: return YES;
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored: return NO;
    }
    
}

- (UIImageOrientation)acy_imageOrientation {
    
    if ([self p_equalsA:0 b:1 c:-1 d:0]) {
        return UIImageOrientationUp;
    }
    else if ([self p_equalsA:0 b:-1 c:1 d:0]) {
        return UIImageOrientationDown;
    }
    else if ([self p_equalsA:-1 b:0 c:0 d:-1]) {
        return UIImageOrientationLeft;
    }
    else if ([self p_equalsA:1 b:0 c:0 d:1]) {
        return UIImageOrientationRight;
    }
    
    
    return UIImageOrientationUp;
}

- (BOOL)p_equalsA:(CGFloat)a
                b:(CGFloat)b
                c:(CGFloat)c
                d:(CGFloat)d {
    
    return [self p_equals:self.preferredTransform a:a b:b c:c d:d];
}



- (BOOL)p_equals:(CGAffineTransform)transform
               a:(CGFloat)a
               b:(CGFloat)b
               c:(CGFloat)c
               d:(CGFloat)d{
    return (transform.a == a &&
            transform.b == b &&
            transform.c == c &&
            transform.d == d);
}

- (CGAffineTransform)acy_transformByFrame:(CGRect)frame {

    CGSize naturalSize = self.naturalSize;
    CGSize displaySize = self.acy_displaySize;
    CGSize targetSize = frame.size;
    
    CGFloat scaleRatio = CGRectGetWidth(frame) / displaySize.width;

    // here width and height is after scale
    CGFloat w =
    [self acy_displayPortrait] ?
    targetSize.height :
    targetSize.width;
    
    CGFloat h =
    [self acy_displayPortrait] ?
    targetSize.width :
    targetSize.height;
    
    CGFloat x =
    CGRectGetMinX(frame);
    
    CGFloat y =
    CGRectGetMinY(frame);
    
    
    
    // this is different.
    CGFloat angle = 0;
    
    CGPoint move = CGPointZero;
    
    switch (self.acy_imageOrientation) {
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored: {
            angle = ACY_DegreesToRadians(90);
            move = CGPointMake(x + w, y);
            break;
        }
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored: {
            angle = ACY_DegreesToRadians(-90);
            move = CGPointMake(x, y + h);
            break;
        }
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored: {
            angle = ACY_DegreesToRadians(180);
            move = CGPointMake(x + w, y+ h);
            break;
        }
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored: {
            angle = ACY_DegreesToRadians(0);
            move = CGPointMake(x, y);
            break;
        }
    }
    
    // 1 scale -> move -> rotate
    //
    CGAffineTransform tranlsation =
    CGAffineTransformTranslate(CGAffineTransformIdentity, move.x, move.y);
    
    
    CGAffineTransform scale =
    CGAffineTransformScale(tranlsation, scaleRatio, scaleRatio);
    
    CGAffineTransform rotation =
    CGAffineTransformRotate(scale, angle);

    return rotation;
}

- (CGRect)acy_cropRectangleByContentsRect:(CGRect)contentsRect {
    CGSize displaySize = self.acy_displaySize;

    CGFloat displayWidth = displaySize.width;
    CGFloat displayHeight = displaySize.height;

    CGFloat x = CGRectGetMinX(contentsRect) * displayWidth;
    CGFloat y = CGRectGetMinY(contentsRect) * displayHeight;
    CGFloat w = CGRectGetWidth(contentsRect) * displayWidth;
    CGFloat h = CGRectGetHeight(contentsRect) * displayHeight;

    switch (self.acy_imageOrientation) {
            
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored: {
            return CGRectMake(y, displayWidth - x - w, h, w);
        }
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored: {
            return CGRectMake(displayHeight - h - y, x, h, w);
        }
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored: {
            return CGRectMake(displayWidth - w - x, displayHeight - y - h, w, h);
        }
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored: {
            return CGRectMake(x, y, w, h);
        }
    }
}

@end
