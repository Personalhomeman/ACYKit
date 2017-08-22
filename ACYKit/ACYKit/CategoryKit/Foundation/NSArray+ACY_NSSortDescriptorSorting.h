//
//  NSArray+ACY_NSSortDescriptorSorting.h
//  Pods
//
//  Created by Arthur Qiu on 19/04/2017.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (ACY_NSSortDescriptorSorting)

/**
 Convenience method to sort a `NSArray` with keys.
 
 @param keys The parameter in the `NSSortDescriptor` initializer.
 @param ascending The parameter in the `NSSortDescriptor` initializer.
 @return A new `NSArray` instance which has been sorted by the parameters.
 */
- (NSArray *)acy_sortedArrayUsingKeys:(NSArray<NSString *> *)keys
							ascending:(BOOL)ascending;

@end

NS_ASSUME_NONNULL_END
