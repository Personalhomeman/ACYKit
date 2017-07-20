//
//  UIButton+ACY_UIControlState.h
//  Pods
//
//  Created by Arthur on 20/07/2017.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ACY_UIControlState)

- (void)acy_setImage:(UIImage *)image
               title:(NSString *)title
          titleColor:(nullable UIColor *)titleColor
            forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
