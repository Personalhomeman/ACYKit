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

- (void)acy_bindAction:(SEL)action
            withTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
