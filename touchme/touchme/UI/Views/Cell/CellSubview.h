//
//  CellSubview.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseSubview.h"

//layout options
#import "LayoutOptions.h"

@interface CellSubview : BaseSubview

//abstract
- (void)cleanView;
- (CGFloat)heightWithCustomObject:(id)customObject;
+ (CGFloat)recomendedWidth;

@property (nonatomic, readonly) LayoutOptions layoutOptions;

@end
