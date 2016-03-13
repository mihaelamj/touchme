//
//  BaseCollectionViewCell.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

//auto layout
#import "Masonry.h"

//style
#import "UILabel+TMStyle.h"
#import "UIFont+TMStyle.h"
#import "UIColor+TMStyle.h"

//content view
#import "CellSubview.h"

@interface BaseCollectionViewCell : UICollectionViewCell

//static
+ (CGSize)recomendedCellSize;//abstract
+ (NSString *)reuseIdentifier;

//content
+ (Class)cellSubviewClass;
@property (nonatomic, strong) CellSubview *cellContentView;

//data
- (void)customize:(id)customObject; //abstract
- (void)cleanView; //abstract

//helper
- (void)beforeAddCustomSubviews; //abstract

//layout
- (void)addCustomSubviews; //abstract
- (void)setSubviewConstraints; //abstract

@end
