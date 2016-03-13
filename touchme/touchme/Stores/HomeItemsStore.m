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

//model class
#import "MMJColorPalette.h"

//cell classes
#import "PaletteItemTableViewCell.h"
#import "PaletteItemCollectionViewCell.h"

//store classes
#import "PalettesStore.h"

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

- (NSArray *)makeItemsWithController:(BaseViewController *)controller
{
    NSArray *items = [HomeItem itemArray];
    
    __weak BaseViewController *weakController = controller;
    
    for (HomeItem *item in items) {
        
        TMRouteType routeType = [TMRoute routeTypeForHomeItemType:item.type];
        NSDictionary *params = [HomeItemsStore paramsForRouteType:routeType];
        item.actionBlock = ^{
            [TMRoute navigateRouteType:routeType fromViewController:weakController params:params modal:NO];
        };
        
    }
    
    return items;
}

#pragma mark Helpers

+ (NSDictionary *)paramsForRouteType:(TMRouteType)routeType
{
    Class storeClas = nil;
    Class cellClass = nil;
    Class modelClass = nil;
    NSString *vcTitle = nil;
    NSString *viewAL = nil;

    switch (routeType) {
            
        case TMRouteType_HomeItem_TableView: {
            storeClas = [PalettesStore class];
            cellClass = [PaletteItemTableViewCell class];
            modelClass = [MMJColorPalette class];
            vcTitle = NSLocalizedString(@"Color Palettes Title", nil);
            viewAL = NSLocalizedString(@"ColorPalettes TableViewController View Accessibility Label", nil);
            break;
        }

        case TMRouteType_HomeItem_CollectionView: {
            storeClas = [PalettesStore class];
            cellClass = [PaletteItemCollectionViewCell class];
            modelClass = [MMJColorPalette class];
            vcTitle = NSLocalizedString(@"Color Palettes Title", nil);
            viewAL = NSLocalizedString(@"ColorPalettes CollectionViewController View Accessibility Label", nil);
            break;
        }

        case TMRouteType_HomeItem_View:
            return nil;

        default:
            return nil;
    }

    return @{TMKEY_STORE_CLASS: storeClas,
             TMKEY_CELL_CLASS: cellClass,
             TMKEY_MODEL_CLASS: modelClass,
             TMKEY_VIEW_CONTROLLER_TITLE: vcTitle,
             TMKEY_VIEW_ACCSESSIBILITY_LABEL: viewAL,
             TMKEY_ROUTE_TYPE : @(routeType)
             };
}

@end
