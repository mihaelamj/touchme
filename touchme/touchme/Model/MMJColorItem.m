//
//  MMJColorItem.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "MMJColorItem.h"

//helper
#import "UIImage+Colored.h"

#define IMAGE_SIDE 24.0f

@implementation MMJColorItem

@synthesize image = _image;

#pragma mark -
#pragma mark Init

- (instancetype)initWithName:(NSString *)name color:(UIColor *)color hexString:(NSString *)hexString paletteName:(NSString *)paletteName
{
    self = [super init];
    if (self) {
        _name = name;
        _color = color;
        _hexString = hexString;
        _paletteName = paletteName;
    }
    return self;
}

#pragma mark -
#pragma mark Public Properties

- (UIImage *)image
{
    if (!_image) {
        _image = [UIImage imageWithColor:self.color width:IMAGE_SIDE height:IMAGE_SIDE];
    }
    return _image;
}

@end
