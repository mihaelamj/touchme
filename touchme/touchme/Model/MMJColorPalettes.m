//
//  MMJColorPalettes.m
//  ColorPalettes
//
//  Created by Mihaela Mihaljević Jakić on 02/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import "MMJColorPalettes.h"

//model
#import "MMJColorItem.h"

/**
 *  Import all color categories to use in the project
 */

//colors
#import "UIColor+Copic.h"
#import "UIColor+Crayola.h"
#import "UIColor+Pantone.h"
#import "UIColor+Html.h"
#import "UIColor+Crayon.h"

//helpers
#import "UIColor+StandardColors.h"
#import "UIColor+HexString.h"

@interface MMJColorPalettes()

@end

@implementation MMJColorPalettes

#pragma mark - Properties
/**
 *  Add color category name (palette) to the array
 *
 *  @return array of palette/category names
 */
- (NSArray *)palletes
{
    if (!_palletes) {
        _palletes = [MMJColorPalettes paletteNames];
//        _palletes = @[@"copic", @"crayola", @"pantone", @"html", @"crayon"];
    }
    return _palletes;
}

/**
 *  Color family repository
 *
 *  @return colors for a given category
 */

#pragma mark - Public methods

+ (NSArray *)paletteNames
{
    return @[@"copic", @"crayola", @"pantone", @"html", @"crayon"];
}

- (NSArray *)colorsForPalette:(NSString *)palette
{
    NSArray *colors = [UIColor colorNamesWithPrefix:[NSString stringWithFormat:@"%@_", palette]];
    return colors;
}

- (NSArray *)colorItemsForPalette:(NSString *)palette
{
    NSArray *palleteColors = [self colorsForPalette:palette];
    
    NSMutableArray *colorItems = [NSMutableArray array];
    
    for (NSString *colorSelectorName in palleteColors) {
        
        NSString *cleanColorName = [self justColorName:colorSelectorName pallete:palette];
        UIColor *color = [self colorForName:colorSelectorName];
        NSString *colorHex = [UIColor hexStringWithColor:color type:HexColorType_RRGGBB];
        
        MMJColorItem *colorItem = [[MMJColorItem alloc] initWithName:cleanColorName color:color hexString:colorHex paletteName:palette];
        
        [colorItems addObject:colorItem];
    }
    
    return [NSArray arrayWithArray:colorItems];
    
}

+ (MMJColorPalette *)paletteWithName:(NSString *)name
{
    MMJColorPalettes *handler = [[MMJColorPalettes alloc] init];
    
    NSArray *colors = [handler colorsForPalette:name];
    if ([colors count]) {
        return [[MMJColorPalette alloc] initWithName:name colors:colors];
    }
    return nil;
    
}

#pragma mark - 
#pragma mark Private Methods

- (UIColor *)colorForName:(NSString *)name
{
    return [UIColor colorFromName:name];
}

- (NSString *)justColorName:(NSString *)colorSelectorName pallete:(NSString *)pallete
{
    NSString *paletteName = [NSString stringWithFormat:@"%@_", pallete];
    NSRange palleteNameRange = [colorSelectorName rangeOfString:paletteName];
    
    NSRange colorRange = [colorSelectorName rangeOfString:@"_Color"];
    
    NSRange colorNameRange = NSMakeRange(palleteNameRange.length, colorRange.location - palleteNameRange.length);
    return [colorSelectorName substringWithRange:colorNameRange];
}

@end
