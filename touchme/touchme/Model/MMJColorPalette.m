//
//  MMJColorPalette.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "MMJColorPalette.h"

//helper
#import "MMJColorPalettes.h"

//image helper
#import "UIImage+Colored.h"
#import "NSArray+MMJRandom.h"
#import "TMSizes.h"

@implementation MMJColorPalette

@synthesize image = _image;

#pragma mark -
#pragma mark Init

- (instancetype)initWithName:(NSString *)name colors:(NSArray *)colors
{
    self = [super init];
    if (self) {
        _name = name;
        _colors = colors;
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

+ (void)itemsWithCompletion:(ArrayCompletionBlock)completion
{
    NSMutableArray *items = [NSMutableArray array];
    
    //fetch palette names
    NSArray *paletteNames = [MMJColorPalettes paletteNames];
    
    for (NSString *paletteName in paletteNames) {
        //make palettes
        MMJColorPalette *palette = [MMJColorPalettes paletteWithName:paletteName];
        [items addObject:palette];
    }
    
    completion([NSArray arrayWithArray:items], nil);
    
}

#pragma mark -
#pragma mark Public Properties

- (UIImage *)image
{
    if (!_image) {
        
        NSArray *randomArray = [self.colors randomObjects:12];
        NSMutableArray *colorsArray = [NSMutableArray array];
        for (MMJColorItem *colorItem in randomArray) {
            
            UIColor *color = colorItem.color;
            if (color) {
                [colorsArray addObject:color];
            }
        }
        
        CGSize aSize = CGSizeMake(kPaletteImageWidth, kPaletteImageHeight);
        _image = [UIImage imageWithColors:colorsArray size:aSize];
    }
    return _image;
}

@end
