//
//  BaseSubview.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseSubview.h"

@implementation BaseSubview

#pragma mark -
#pragma mark Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self beforeAddCustomSubviews];
        [self addCustomSubviews];
        [self setSubviewConstraints];
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

+ (CGFloat)screenHeight
{
    return [UIScreen mainScreen].applicationFrame.size.height;
}

+ (CGFloat)screenWidth
{
    return [UIScreen mainScreen].applicationFrame.size.width;
}

#pragma mark -
#pragma mark Public Abstract Methods

#pragma mark Layout

- (void)beforeAddCustomSubviews
{
}

- (void)addCustomSubviews
{
}

- (void)setSubviewConstraints
{
}

#pragma mark Height

+ (CGFloat)recomendedHeight
{
    return 0;
}

+ (CGFloat)recomendedHeightPercent
{
    return 0;
}

#pragma mark Customize

- (void)customize:(id)customObject
{
}

@end
