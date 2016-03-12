//
//  NSString+HomeItemType.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "NSString+HomeItemType.h"

@implementation NSString (HomeItemType)

#pragma mark -
#pragma mark Public

+ (NSString *)nameForHomeItemType:(HomeItemType)homeItemType
{
    switch (homeItemType) {
            
        case HomeItemType_TableView:
            return NSLocalizedString(@"HomeItemType_TableView Title", nil);
        case HomeItemType_CollectionView:
            return NSLocalizedString(@"HomeItemType_CollectionView Title", nil);
        case HomeItemType_View:
            return NSLocalizedString(@"HomeItemType_View Title", nil);
            
        default:
            return nil;
    }
}

+ (NSString *)imageNameForHomeItemType:(HomeItemType)homeItemType
{
    switch (homeItemType) {
            
        case HomeItemType_TableView:
            return NSLocalizedString(@"icon_table", nil);
        case HomeItemType_CollectionView:
            return NSLocalizedString(@"icon_collection", nil);
        case HomeItemType_View:
            return NSLocalizedString(@"icon_view", nil);
            
        default:
            return nil;
    }
}

@end
