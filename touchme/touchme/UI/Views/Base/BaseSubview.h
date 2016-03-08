//
//  BaseSubview.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

//auto layout
#import "Masonry.h"

@interface BaseSubview : UIView

//public
+ (CGFloat)screenHeight;
+ (CGFloat)screenWidth;

//public abstract height
+ (CGFloat)recomendedHeight;
+ (CGFloat)recomendedHeightPercent;

//public abstract custumize
- (void)customize:(id)customObject;

//public abstract layout
- (void)beforeAddCustomSubviews;
- (void)addCustomSubviews;
- (void)setSubviewConstraints;

@end
