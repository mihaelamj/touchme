//
//  UIFont+TMStyle.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TMFontStyle) {
    TMFontStyle_VeryBig = 0,
    TMFontStyle_Big,
    TMFontStyle_Medium,
    TMFontStyle_Small,
    TMFontStyle_Tiny,
    TMFontStyle_Count
};

@interface UIFont (TMStyle)

+ (UIFont *)fontWithStyle:(TMFontStyle)style;

@end
