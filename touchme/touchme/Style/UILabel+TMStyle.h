//
//  UILabel+TMStyle.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TMLabelStyle) {
    TMLabelStyle_VeryBigTitle = 0,
    TMLabelStyle_ColorName,
    TMLabelStyle_HexString,
    TMLabelStyle_PaletteName,
    TMLabelStyle_Count
};

@interface UILabel (TMStyle)

+ (UILabel *)labelWithStyle:(TMLabelStyle)style;
- (void)applyStyle:(TMLabelStyle)style;

@end
