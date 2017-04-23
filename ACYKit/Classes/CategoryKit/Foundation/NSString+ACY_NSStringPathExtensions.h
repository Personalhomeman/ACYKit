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

/**
 Convenience method of `-acy_stringByAppendingPathComponents:extension:`.

 @param pathComponent A directory name or a file name.
 @return The full path for the target directory or file.
 */
- (NSString *)acy_stringByAppendingPathComponent:(NSString *)pathComponent;


/**
 Convenience method of `-acy_stringByAppendingPathComponents:extension:`.

 @param pathExtension The file' extension, and the file name is the last component of the path.
 @return The full path for the target file with given extension.
 */
- (NSString *)acy_stringByAppendingPathExtension:(NSString *)pathExtension;


/**
 A safe way to manipulate the delete actoin for url path string.

 @return The full path for target file without the extension.
 */
- (NSString *)acy_stringByDeletingPathExtension;


/**
 Check it is local file path instead of a URL string.

 @return A boolean value presents the path is a file path string.
 */
- (BOOL)acy_isLocalFilePath;


/**
 Convenience method to get the URL for the string itself.

 @return A NSURL.
 */
- (NSURL *)acy_URL;

@end

NS_ASSUME_NONNULL_END
