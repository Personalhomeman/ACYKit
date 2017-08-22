//
//  ACYMacros.h
//  Pods
//
//  Created by Arthur Liu on 17/04/2017.
//
//



/* convert class type */
#define ACY_CLASS_CONVERSION(class,instance) (class *)(instance)


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



/* degrees to radians*/
#define ACY_DegreesToRadians(degrees) ((degrees) * M_PI / 180)
