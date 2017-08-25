//
//  UIButton+ACY_UIControlState.m
//  Pods
//
//  Created by Arthur on 20/07/2017.
//
//

#import "UIButton+ACY_UIControlState.h"
#import "ACYServiceLog.h"

@implementation UIButton (ACY_UIControlState)

- (void)acy_setImage:(nullable UIImage *)image
     backgroundImage:(nullable UIImage *)backgroundImage
               title:(nullable NSString *)title
          titleColor:(nullable UIColor *)titleColor
            forState:(UIControlState)state {
    
    [self setImage:image forState:state];
    [self setBackgroundImage:backgroundImage forState:state];
    [self setTitle:title forState:state];
    [self setTitleColor:titleColor forState:state];
    
}

- (void)acy_setTitle:(nullable NSString *)title
          titleColor:(nullable UIColor *)titleColor
            forState:(UIControlState)state {
    
    [self setTitle:title forState:state];
    [self setTitleColor:titleColor forState:state];
}

@end
