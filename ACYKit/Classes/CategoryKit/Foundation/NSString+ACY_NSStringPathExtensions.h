//
//  NSString+ACY_NSStringPathExtensions.h
//  Pods
//
//  Created by Arthur Qiu on 3/26/17.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ACY_NSStringPathExtensions)


/**
 Stitch a url string, the method will solve the problem which caused by `stringByAppendingPathComponent:` method. Using "THAT" method will make "//" to become "/", one "/" will disappear. And now it is to solve it.
 
 @param pathComponents A string array like this @[@"dir1name", @"subdir2name", @"subsubdir3name"]. Which will make the full path like this: "scheme://host/path/dir1name/subdir2name/subsubdir3name.
 @return A full path with correct format without bug that is '//' symbol to become "/".
 */
- (NSString *)acy_stringByAppendingPathComponents:(NSArray<NSString *> *)pathComponents
										extension:(nullable NSString *)extension;
- (NSString *)acy_stringByAppendingPathComponent:(NSString *)pathComponent;
- (NSString *)acy_stringByAppendingPathExtension:(NSString *)pathExtension;

- (NSString *)acy_stringByDeletingPathExtension;

- (BOOL)acy_isLocalFilePath;

- (NSURL *)acy_URL;

@end

NS_ASSUME_NONNULL_END
