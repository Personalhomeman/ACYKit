//
//  UIScrollView+ACY_ScrollIndicators.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "UIScrollView+ACY_ScrollIndicators.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

///======================================================================
/// @name ACYAlwaysOpaqueImageView
///======================================================================

@interface ACYAlwaysOpaqueImageView : UIImageView

@end

@implementation ACYAlwaysOpaqueImageView

- (void)setAlpha:(CGFloat)alpha {
    [super setAlpha:1.0];
}

@end



///======================================================================
/// @name UIScrollView (ACY_ScrollIndicators)
///======================================================================

typedef NS_ENUM(NSInteger, ACYShowScrollIndicatorDirection) {
    ACYShowScrollIndicatorDirectionVertical,
    ACYShowScrollIndicatorDirectionHorizontal,
};

@implementation UIScrollView (ACY_ScrollIndicators)

- (void)acy_alwaysShowVerticalScrollIndicator:(BOOL)always {
    [self acy_alwaysShowScrollIndicator:ACYShowScrollIndicatorDirectionVertical
                                   show:always];
}

- (void)acy_alwaysShowHorizontalScrollIndicator:(BOOL)always {
    [self acy_alwaysShowScrollIndicator:ACYShowScrollIndicatorDirectionHorizontal
                                   show:always];
}

- (void)acy_alwaysShowScrollIndicator:(ACYShowScrollIndicatorDirection)mode
                                 show:(bool)always {
    
    CGFloat side = 0;
    CGFloat contentSizeSide = 0;
    
    switch (mode) {
            
        case ACYShowScrollIndicatorDirectionVertical: {
            side = CGRectGetHeight(self.frame);
            contentSizeSide = self.contentSize.height;
            break;
        }
        case ACYShowScrollIndicatorDirectionHorizontal: {
            side = CGRectGetWidth(self.frame);
            contentSizeSide = self.contentSize.width;
            break;
        }
    }
    
    if (side <= contentSizeSide) {
        CGSize contentSize = self.contentSize;
        side = contentSizeSide + 1;
        self.contentSize = contentSize;
    }
    
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            // Get the vertical indicator.
            CGFloat width = CGRectGetWidth(obj.frame);
            CGFloat height = CGRectGetHeight(obj.frame);
            
            CGFloat shorterSide = 0;
            CGFloat longerSide = 0;
            
            switch (mode) {
                    
                case ACYShowScrollIndicatorDirectionVertical: {
                    shorterSide = width;
                    longerSide = height;
                    break;
                }
                case ACYShowScrollIndicatorDirectionHorizontal: {
                    shorterSide = height;
                    longerSide = width;
                    break;
                }
            }
            if (shorterSide < 10.0 &&
                longerSide > shorterSide) {
                // Replace the class to AlwaysOpaqueImageView
                if (always) {
                    object_setClass(obj, [ACYAlwaysOpaqueImageView class]);
                }
                else {
                    object_setClass(obj, [UIImageView class]);
                }
                
                
                *stop = YES;
            }
        }
    }];
    
    [self flashScrollIndicators];
}

@end

NS_ASSUME_NONNULL_END
