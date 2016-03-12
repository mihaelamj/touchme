//
//  UIFont+TMStyle.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "UIFont+TMStyle.h"

@implementation UIFont (TMStyle)

+ (UIFont *)fontWithStyle:(TMFontStyle)style
{
    switch (style) {
        case TMFontStyle_VeryBig:
            return [UIFont fontWithName:@"Avenir-Medium" size:20];
        case TMFontStyle_Big:
            return [UIFont fontWithName:@"Avenir-Medium" size:18];
        case TMFontStyle_Medium:
            return [UIFont fontWithName:@"Avenir-Medium" size:16];
        case TMFontStyle_Small:
            return [UIFont fontWithName:@"Avenir-Medium" size:14];
        case TMFontStyle_Tiny:
            return [UIFont fontWithName:@"Avenir-Medium" size:12];
        default:
            return [UIFont fontWithStyle:TMFontStyle_Medium];
    }
}

@end
