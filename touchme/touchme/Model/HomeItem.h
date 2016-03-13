//
//  HomeItem.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseItem.h"

//enum
#import "HomeItemType.h"

//for UIImage
#import <UIKit/UIKit.h>

@interface HomeItem : BaseItem

- (instancetype)initWithType:(HomeItemType)type;

+ (NSArray *)itemArray;

@property (nonatomic, readonly) HomeItemType type;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) UIImage *image;

@end
