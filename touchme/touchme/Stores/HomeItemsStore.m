//
//  HomeItemsStore.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "HomeItemsStore.h"

//model
#import "HomeItem.h"
//route
#import "TMRoute.h"

@interface HomeItemsStore ()

@end

@implementation HomeItemsStore


#pragma mark -
#pragma mark Public Methods

+ (NSArray *)itemsWithError:(NSError **)error controller:(BaseViewController *)controller
{
    *error = nil;
    HomeItemsStore *store = [[HomeItemsStore alloc] init];
    NSArray *items = [store makeItemsWithController:controller];
    return items;
}

#pragma mark -
#pragma mark Private Methods

- (TMRouteType)routeTypeForHomeItemType:(HomeItemType)homeItemType
{
    switch (homeItemType) {
        case HomeItemType_TableView:
            return TMRouteType_HomeItem_TableView;
        case HomeItemType_CollectionView:
            return TMRouteType_HomeItem_CollectionView;
        case HomeItemType_View:
            return TMRouteType_HomeItem_View;
            
        default:
            return TMRouteType_Count;
    }
}

- (NSArray *)makeItemsWithController:(BaseViewController *)controller
{
    NSArray *items = [HomeItem itemArray];
    
    __weak BaseViewController *weakController = controller;
    
    for (HomeItem *item in items) {
        
        TMRouteType routeType = [self routeTypeForHomeItemType:item.type];
        
        item.actionBlock = ^{
            [TMRoute navigateRouteType:routeType fromViewController:weakController params:nil modal:NO];
        };
        
    }
    
    return items;
}

@end
