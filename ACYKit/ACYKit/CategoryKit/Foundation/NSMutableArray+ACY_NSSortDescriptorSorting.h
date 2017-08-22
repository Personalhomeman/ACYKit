//
//  NSMutableArray+ACY_NSSortDescriptorSorting.h
//  Pods
//
//  Created by Arthur Qiu on 19/04/2017.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (ACY_NSSortDescriptorSorting)


/**
 Convenience method to sort a `NSMutableArray` with keys.

 @param keys The parameter in the `NSSortDescriptor` initializer.
 @param ascending The parameter in the `NSSortDescriptor` initializer.
 */
- (void)acy_sortUsingKeys:(NSArray<NSString *> *)keys
				ascending:(BOOL)ascending;

@end

NS_ASSUME_NONNULL_END
