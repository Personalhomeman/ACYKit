//
//  UIView+ACY_UIViewHierarchy.h
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import <UIKit/UIKit.h>



@interface UIView (ACY_UIViewHierarchy)

@property (nonatomic, assign, readonly) BOOL expandTouchArea;
@property (nonatomic, assign, readonly) CGSize expandOffset;

- (void)acy_addSubviews:(NSArray<__kindof UIView *> *)subviews;



/**
 Expand the view's touch area, the offset.width and height should be larger than 0.
 
 @param offset The delta value between present size and target size;
 */
- (void)acy_expandTouchAreaWithSizeOffset:(CGSize)offset;


/**
 Expand the view's touch area, the size should be larger than now.
 
 @param targetSize The size you wish to expand to. Should be larger than now.
 */
- (void)acy_expandTouchAreaToSize:(CGSize)targetSize;

@end
