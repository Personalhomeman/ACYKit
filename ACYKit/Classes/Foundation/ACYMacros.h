//
//  ACYMacros.h
//  Pods
//
//  Created by Arthur Liu on 17/04/2017.
//
//



/* weakify & strongify*/
#if DEBUG
#define acy_keywordify autoreleasepool {}
#else
#define acy_keywordify try {} @catch (...) {}
#endif

#define ACYWeakify(self) \
acy_keywordify \
__weak __typeof__(self) self_weak_ = (self);


#define ACYStrongify(self) \
acy_keywordify \
__strong __typeof__(self) self = self_weak_;



// Real Singleton
// If invoke this macro, you should declare a method: `+ (instancetype)sharedInstance;` in the .h file of the class, where you invoke the macro in the .m file.
#define ACYSharedInstance(cls)                                      \
static cls *sharedInstance = nil;                                   \
+ (instancetype)sharedInstance {                                    \
    static dispatch_once_t onceToken;                               \
    dispatch_once(&onceToken, ^{                                    \
        sharedInstance = [[cls alloc] init];                        \
    });                                                             \
    return sharedInstance;                                          \
}                                                                   \
+ (instancetype)allocWithZone:(struct _NSZone *)zone {              \
    static dispatch_once_t onceToken;                               \
    dispatch_once(&onceToken, ^{                                    \
        sharedInstance = [super allocWithZone:zone];                \
    });                                                             \
    return sharedInstance;                                          \
}                                                                   \
- (instancetype)init {                                              \
    if ([self respondsToSelector:@selector(initMethod)]) {          \
        [self performSelector:@selector(initMethod)];               \
    }                                                               \
    return sharedInstance;                                          \
}                                                                   \
/* If class conforms protocol <NSCopying> */                        \
- (id)copyWithZone:(NSZone *)zone {                                 \
    return self;                                                    \
}                                                                   \
/* If class conforms protocol <NSMutableCopying>*/                  \
- (id)mutableCopyWithZone:(NSZone *)zone {                          \
    return self;                                                    \
}


