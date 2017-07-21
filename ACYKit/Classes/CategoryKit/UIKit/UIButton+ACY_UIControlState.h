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

- (void)acy_setImage:(nullable UIImage *)image
     backgroundImage:(nullable UIImage *)backgroundImage
               title:(nullable NSString *)title
          titleColor:(nullable UIColor *)titleColor
            forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
