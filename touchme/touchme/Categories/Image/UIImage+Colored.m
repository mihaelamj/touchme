//
//  UIImage+Colored.m
//  MMJColorPaletteCategoryMaker
//
//  Created by Mihaela Mihaljević Jakić on 06/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import "UIImage+Colored.h"

@implementation UIImage (Colored)

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

@end
