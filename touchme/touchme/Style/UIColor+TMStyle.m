//
//  UIColor+TMStyle.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "UIColor+TMStyle.h"

@implementation UIColor (TMStyle)

#pragma mark -
#pragma mark Public Methods

+ (UIColor *)colorWithStyle:(TMColorStyle)style
{
    switch (style) {
        case TMColorStyle_Blue:
            return [UIColor colorWithRed:5.0f/255.0f green:146.0f/255.0f blue:198.0f/255.0f alpha:1.0f];
        case TMColorStyle_Green:
            return [UIColor colorWithRed:131.0f/255.0f green:214.0f/255.0f blue:12.0f/255.0f alpha:1.0f];
        case TMColorStyle_White:
            return [UIColor whiteColor];
        case TMColorStyle_Red:
            return [UIColor colorWithRed:239.0f/255.0f green:78.0f/255.0f blue:88.0f/255.0f alpha:1.0f];
        case TMColorStyle_GrayLight:
            return [UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f  alpha:1.0f];
        case TMColorStyle_GrayDark:
            return [UIColor colorWithRed:68.0f/255.0f green:68.0f/255.0f blue:68.0f/255.0f  alpha:1.0f];
        case TMColorStyle_Violet:
            return [UIColor colorWithRed:0.745 green:0.369 blue:0.965 alpha:1];
        case TMColorStyle_Orange:
            return [UIColor colorWithRed:0.973 green:0.522 blue:0.173 alpha:1];
        case TMColorStyle_Yellow:
            return [UIColor colorWithRed:0.925 green:0.761 blue:0.043 alpha:1];
        default:
            return [UIColor colorWithStyle:TMColorStyle_GrayDark];
    }
}

@end
