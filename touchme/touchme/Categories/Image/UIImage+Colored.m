//
//  UIImage+Colored.m
//  MMJColorPaletteCategoryMaker
//
//  Created by Mihaela Mihaljević Jakić on 06/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import "UIImage+Colored.h"

@implementation UIImage (Colored)

#pragma mark -
#pragma mark Public Methods

+ (UIImage *)imageWithColor:(UIColor *)color width:(CGFloat)width height:(CGFloat)height
{
    CGRect rect = CGRectMake(0, 0, width, height);
    
    //Create a width by height pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    //Fill image with color
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)colorize:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, 0, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGRect rect = CGRectMake(0,0,self.size.width,self.size.height);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    [color setFill];
    CGContextFillRect(context, rect);
    
    CGContextSetBlendMode(context, kCGBlendModeDestinationIn);
    CGContextDrawImage(context, rect, self.CGImage);
    
    UIImage *colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return colorizedImage;
}

+ (UIImage *)mergedImageFromImages:(NSArray *)images
{
    if (![images count]) {
        return nil;
    }
    //find out the size
    CGSize size = CGSizeZero;
    CGFloat height = 0.0f;
    
    for (UIImage *image in images) {
        height = MAX(height, image.size.height);
        size.height = height;
        size.width += image.size.width;
    }
    
    //start new image
    UIGraphicsBeginImageContext(size);
    
    //draw
    CGFloat x = 0.0f;
    for (UIImage *image in images) {
        CGRect aRect = CGRectMake(x, 0.0f, image.size.width, image.size.height);
        [image drawInRect:aRect];
        x += image.size.width;
    }
    
    //assign context to new UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //end context
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColors:(NSArray *)colors size:(CGSize)size
{
    if (![colors count]) {
        return nil;
    }
    //determine width
    CGFloat width = size.width / [colors count];
    
    NSMutableArray *colorImages = [NSMutableArray array];
    
    for (UIColor *color in colors) {
        if (![color isKindOfClass:[UIColor class]]) {
            continue;
        }
        UIImage *image = [self imageWithColor:color width:width height:size.height];
        [colorImages addObject:image];
    }
    
    return [self mergedImageFromImages:colorImages];
}

#pragma mark -
#pragma mark Test

@end
