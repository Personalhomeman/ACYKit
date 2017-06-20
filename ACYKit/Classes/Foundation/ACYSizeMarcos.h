//
//  ACYSizeMarcos.h
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//



// size
#define ACY_SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define ACY_SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define ACY_STATUS_BAR_HEIGHT   [UIApplication sharedApplication].statusBarFrame.size.height
#define ACY_NAVI_BAR_HEIGHT     44.0f
#define ACY_KEYBOARD_HEIGHT     216.0f
#define ACY_SCREEN_SCALE        [UIScreen mainScreen].scaleg


/* 1.0 Pixel*/
#define ACY_ONE_PIXEL_THICKNESS       (1.0 / [UIScreen mainScreen].scale)
#define ACY_ONE_PIXEL_ADJUST_OFFSET   ((ACY_ONE_PIXEL_THICKNESS) / 2.0)

/* size CONVERSION */
#define ACY_WIDTH_CONVERSION(len)    ((ACY_SCREEN_WIDTH / ACY_IPHONE_4_7_INCH_WIDTH) * (len))
#define ACY_HEIGHT_CONVERSION(len)   ((ACY_SCREEN_HEIGHT / ACY_IPHONE_4_7_INCH_HEIGHT) * (len))



/* devices sizes */
#define ACY_IPHONE_3_5_INCH_WIDTH       320.0
#define ACY_IPHONE_4_0_INCH_WIDTH       320.0
#define ACY_IPHONE_4_7_INCH_WIDTH       375.0
#define ACY_IPHONE_5_5_INCH_WIDTH       414.0

#define ACY_IPHONE_3_5_INCH_HEIGHT      480.0
#define ACY_IPHONE_4_0_INCH_HEIGHT      568.0
#define ACY_IPHONE_4_7_INCH_HEIGHT      667.0
#define ACY_IPHONE_5_5_INCH_HEIGHT      736.0



/* iPhone devices */
#define ACY_IS_IPHONE_3_5_INCH_DEVICE \
(ACY_IPHONE_3_5_INCH_HEIGHT == ACY_SCREEN_HEIGHT)

#define ACY_IS_IPHONE_4_0_INCH_DEVICE \
(ACY_IPHONE_4_0_INCH_HEIGHT == ACY_SCREEN_HEIGHT)

#define ACY_IS_IPHONE_4_7_INCH_DEVICE \
(ACY_IPHONE_4_7_INCH_HEIGHT == ACY_SCREEN_HEIGHT)

#define ACY_IS_IPHONE_5_5_INCH_DEVICE \
(ACY_IPHONE_5_5_INCH_HEIGHT == ACY_SCREEN_HEIGHT)



