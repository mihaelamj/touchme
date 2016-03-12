//
//  HomeItem.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "HomeItem.h"

//string helper
#import "NSString+HomeItemType.h"

@implementation HomeItem

#pragma mark -
#pragma mark Init

- (instancetype)initWithType:(HomeItemType)type
{
    self = [super init];
    if (self) {
        _type = type;
        _name = [NSString nameForHomeItemType:_type];
        _imageName = [NSString imageNameForHomeItemType:_type];
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

+ (NSArray *)itemArray
{
    NSMutableArray *items = [NSMutableArray array];
    
    for (int i = 0; i < HomeItemType_Count; ++i) {
        HomeItemType type = (HomeItemType)i;
        HomeItem *item = [[HomeItem alloc] initWithType:type];
        [items addObject:item];
    }
    
    return [NSArray arrayWithArray:items];
}

#pragma mark -
#pragma mark Framework Overrides

- (NSString *)description
{
    return self.name;
}

@end
