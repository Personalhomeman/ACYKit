//
//  NSString+ACY_NSStringExtensionMethods.h
//  Pods
//
//  Created by Arthur Qiu on 3/26/17.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ACYStringPosition) {
	ACYStringPositionPrefix, // prefix
	ACYStringPositionSuffix, // suffix
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ACY_NSStringExtensionMethods)


/**
 A convenience method to delete characters.
 
 @param position Either the suffix or the prefix. Using the enumeration `ACYStringPosition`.
 @param count The characters count will be deleted.
 @return The string after deleteing the characters.
 */
- (NSString *)acy_stringByDeletingCharactersAt:(ACYStringPosition)position
                               charactersCount:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
