//
//  MMJColorItem.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseItem.h"

//for UIImage
#import <UIKit/UIKit.h>

@interface MMJColorItem : BaseItem

@property (nonatomic, strong, readonly) NSString *paletteName;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, strong, readonly) NSString *hexString;
@property (nonatomic, strong, readonly) UIImage *image;

- (instancetype)initWithName:(NSString *)name color:(UIColor *)color hexString:(NSString *)hexString paletteName:(NSString *)paletteName;


@end
