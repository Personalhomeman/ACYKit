//
//  UIView+ACY_UIViewHierarchy.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "UIView+ACY_UIViewHierarchy.h"
#import "ACYServiceLog.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

static const void * ACY_ExpandTouchAreaKey = &ACY_ExpandTouchAreaKey;
static const void * ACY_ExpandOffsetKey = &ACY_ExpandOffsetKey;

@implementation UIView (ACY_UIViewHierarchy)

@dynamic expandTouchArea;
@dynamic expandOffset;

- (void)acy_addSubviews:(NSArray<__kindof UIView *> *)subviews {
    if (!subviews.count) {
        DDLogWarn(@"Forgot to add subview in the %s",__FUNCTION__);
    }
    
    [subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DDAssertCondition(obj);
        [self addSubview:obj];
    }];
}


- (void)acy_expandTouchAreaWithSizeOffset:(CGSize)offset {
    
    if (offset.width < 0 ||
        offset.height < 0) {
        DDLogWarn(@"%s, offset should larger than 0!",__PRETTY_FUNCTION__);
        return;
    }
    
    // enable to expand the touch area.
    self.expandTouchArea = YES;
    self.expandOffset = offset;
    
}

- (void)acy_expandTouchAreaToSize:(CGSize)targetSize {
    if (targetSize.width < CGRectGetWidth(self.bounds) ||
        targetSize.height < CGRectGetHeight(self.bounds)) {
        DDLogWarn(@"%s, target size should larger than now!",__PRETTY_FUNCTION__);
        return;
    }
    
    // enable to expand the touch area
    CGSize offset = CGSizeZero;
    offset.width = targetSize.width - CGRectGetWidth(self.bounds);
    offset.height = targetSize.height - CGRectGetHeight(self.bounds);
    
    [self acy_expandTouchAreaWithSizeOffset:offset];
}

#pragma mark - Override

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    CGRect bounds = self.bounds;
    
    if (self.expandTouchArea) {
        CGFloat widthDelta = self.expandOffset.width;
        CGFloat heightDelta = self.expandOffset.height;
        
        /* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
         decrease its size by `(2*dx, 2*dy)'. */
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    }
    
    return CGRectContainsPoint(bounds, point);
}

#pragma mark - Properties

- (BOOL)expandTouchArea {
    return [objc_getAssociatedObject(self, &ACY_ExpandTouchAreaKey) boolValue];
}

- (void)setExpandTouchArea:(BOOL)expandTouchArea {
    objc_setAssociatedObject(self, &ACY_ExpandTouchAreaKey, @(expandTouchArea), OBJC_ASSOCIATION_ASSIGN);
}

- (CGSize)expandOffset {
    NSValue *value =
    objc_getAssociatedObject(self, &ACY_ExpandOffsetKey);
    
    if (!value) {
        value = [NSValue valueWithCGSize:CGSizeZero];
        self.expandOffset = [value CGSizeValue];
    }
    
    return [value CGSizeValue];
}

- (void)setExpandOffset:(CGSize)expandOffset {
    objc_setAssociatedObject(self, &ACY_ExpandOffsetKey, [NSValue valueWithCGSize:expandOffset], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

NS_ASSUME_NONNULL_END
