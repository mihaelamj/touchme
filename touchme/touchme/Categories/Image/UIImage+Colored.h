//
//  UIImage+Colored.h
//  MMJColorPaletteCategoryMaker
//
//  Created by Mihaela Mihaljević Jakić on 06/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Colored)

+ (UIImage *)imageWithColor:(UIColor *)color width:(CGFloat)width height:(CGFloat)height;

- (UIImage *)colorize:(UIColor *)color;

+ (UIImage *)mergedImageFromImages:(NSArray *)images; //horizontally, takes the max height
+ (UIImage *)imageWithColors:(NSArray *)colors size:(CGSize)size;//horizontally

@end
