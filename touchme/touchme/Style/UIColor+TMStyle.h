//
//  UIColor+TMStyle.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TMColorStyle) {
    TMColorStyle_Blue = 0,
    TMColorStyle_Green,
    TMColorStyle_White,
    TMColorStyle_Red,
    TMColorStyle_GrayLight,
    TMColorStyle_GrayDark,
    TMColorStyle_Violet,
    TMColorStyle_Orange,
    TMColorStyle_Yellow,
    TMColorStyle_Count
};

@interface UIColor (TMStyle)

+ (UIColor *)colorWithStyle:(TMColorStyle)style;

@end
