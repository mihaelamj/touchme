//
//  NSString+TMRouteType.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "NSString+TMRouteType.h"

@implementation NSString (TMRouteType)

+ (NSString *)nameForRouteType:(TMRouteType)routeType
{
    switch (routeType) {
            
        case TMRouteType_HomeItem_TableView:
            return @"HomeItem_TableView";
        case TMRouteType_HomeItem_CollectionView:
            return @"HomeItem_CollectionView";
        case TMRouteType_HomeItem_View:
            return @"HomeItem_View";
            
        default:
            return nil;
    }
}

@end
