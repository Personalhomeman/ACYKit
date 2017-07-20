//
//  UIButton+ACY_UIControlState.m
//  Pods
//
//  Created by Arthur on 20/07/2017.
//
//

#import "UIButton+ACY_UIControlState.h"
#import "ACYLogManager.h"

@implementation UIButton (ACY_UIControlState)

- (void)acy_setImage:(UIImage *)image
               title:(NSString *)title
          titleColor:(UIColor *)titleColor
            forState:(UIControlState)state {
    
    DDAssertCondition(image);
    DDAssertCondition(title);
    
    [self setImage:image forState:state];
    [self setTitle:title forState:state];
    
    if (titleColor) {
        [self setTitleColor:titleColor forState:state];
    }
}

@end
