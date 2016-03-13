//
//  UILabel+TMStyle.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "UILabel+TMStyle.h"

//styles
#import "UIFont+TMStyle.h"
#import "UIColor+TMStyle.h"

@implementation UILabel (TMStyle)

#pragma mark -
#pragma mark Public Methods

+ (UILabel *)labelWithStyle:(TMLabelStyle)style
{
    UILabel *label = [self labelForStyle:style];
    return label;
}

- (void)applyStyle:(TMLabelStyle)style
{
    self.backgroundColor = [UIColor clearColor];
    self.font = [UILabel fontForStyle:style];
    self.textColor = [UILabel textColorForStyle:style];
    self.textAlignment = [UILabel textAligmentForStyle:style];
    self.numberOfLines = [UILabel numberOfLinesForStyle:style];
}

#pragma mark -
#pragma mark Private Methods

+ (UILabel *)labelForStyle:(TMLabelStyle)style
{
    //create label
    UILabel *label = [[UILabel alloc] init];
    
    //style label
    [label applyStyle:style];
    
    //return style label
    return label;
}

+ (UIFont *)fontForStyle:(TMLabelStyle)style
{
    switch (style) {
        case TMLabelStyle_VeryBigTitle:
            return [UIFont fontWithStyle:TMFontStyle_VeryBig];
        case TMLabelStyle_ColorName:
            return [UIFont fontWithStyle:TMFontStyle_Medium];
        case TMLabelStyle_HexString:
            return [UIFont fontWithStyle:TMFontStyle_Small];
        case TMLabelStyle_PaletteName:
            return [UIFont fontWithStyle:TMFontStyle_Medium];
        default:
            return [UIFont fontWithStyle:TMFontStyle_Count];
    }
}

+ (UIColor *)textColorForStyle:(TMLabelStyle)style
{
    switch (style) {
        case TMLabelStyle_VeryBigTitle:
            return [UIColor colorWithStyle:TMColorStyle_GrayDark];
        case TMLabelStyle_ColorName:
            return [UIColor colorWithStyle:TMColorStyle_Blue];
        case TMLabelStyle_HexString:
            return [UIColor colorWithStyle:TMColorStyle_GrayDark];
        case TMLabelStyle_PaletteName:
            return [UIColor colorWithStyle:TMColorStyle_GrayDark];
        default:
            return [UIColor colorWithStyle:TMColorStyle_Count];
    }
}

+ (NSTextAlignment)textAligmentForStyle:(TMLabelStyle)style
{
    switch (style) {
        case TMLabelStyle_VeryBigTitle:
            return NSTextAlignmentCenter;
            
        default:
            return NSTextAlignmentLeft;
    }
}

+ (NSInteger)numberOfLinesForStyle:(TMLabelStyle)style
{
    switch (style) {
        default:
            return 1;
    }
}

@end
