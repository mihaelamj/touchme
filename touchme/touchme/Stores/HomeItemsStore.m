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
//params keys
#import "TM_Keys.h"

//cell classes
#import "PaletteItemTableViewCell.h"
#import "PaletteItemCollectionViewCell.h"

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
            
//        case TMRouteType_ColorPalettes:
//            TMRouteType_Colors,
            
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

+ (NSDictionary *)paramsForRouteType:(TMRouteType)routeType
{
    Class storeClas = nil;
    Class cellClass = nil;
    NSString *vcTitle = nil;
    NSString *viewAL = nil;

    switch (routeType) {
        case TMRouteType_HomeItem_TableView: {
            storeClas = [self class];
            cellClass = [PaletteItemTableViewCell class];
            vcTitle = NSLocalizedString(@"Color Palettes Title", nil);
            viewAL = NSLocalizedString(@"ColorPalettes TableViewController View Accessibility Label", nil);
        }

        case TMRouteType_HomeItem_CollectionView: {
            storeClas = [self class];
            cellClass = [PaletteItemCollectionViewCell class];
            vcTitle = NSLocalizedString(@"Color Palettes Title", nil);
            viewAL = NSLocalizedString(@"ColorPalettes CollectionViewController View Accessibility Label", nil);
        }

        case TMRouteType_HomeItem_View:
            return nil;

        default:
            return nil;
    }

    return @{TMKEY_STORE_CLASS: storeClas,
             TMKEY_VIEW_CONTROLLER_TITLE: cellClass,
             TMKEY_VIEW_ACCSESSIBILITY_LABEL: vcTitle,
             TMKEY_CELL_CLASS: viewAL
             };
}

@end
