//
//  NSObject+ACY_UIView.h
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ACY_UIView)


/**
 Convenience method to add a trigger method when tapping the control.

 @param action SEL type, the selector it will invoke when receiving the event.
 @param target An instance, which owns and invoke the selector.
 */
- (void)acy_bindAction:(SEL)action
            withTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
