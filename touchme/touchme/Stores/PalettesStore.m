//
//  PalettesStore.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "PalettesStore.h"

//model
#import "MMJColorPalette.h"

//model class
#import "MMJColorItem.h"

//store
#import "ColorsStore.h"

//cell classes
#import "ColorItemTableViewCell.h"
#import "ColorItemCollectionViewCell.h"

@interface PalettesStore ()

@end

@implementation PalettesStore

#pragma mark -
#pragma mark Public Methods

+ (void)itemsWithCompletion:(ArrayCompletionBlock)completion controller:(BaseViewController *)controller
{
    [MMJColorPalette itemsWithCompletion:^(NSArray *array, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        [self decorateItems:array controller:controller];
        completion(array, error);
    }];
}

#pragma mark -
#pragma mark Private Methods

+ (void)decorateItems:(NSArray *)items controller:(BaseViewController *)controller
{
    __weak BaseViewController *weakController = controller;
    
    for (MMJColorPalette *palette in items) {
        
        TMRouteType routeType = controller.routeType;
        NSDictionary *params = [PalettesStore paramsForRouteType:routeType parentItems:palette.colors];
        palette.actionBlock = ^{
            [TMRoute navigateRouteType:routeType fromViewController:weakController params:params modal:NO];
        };
        
    }
}

#pragma mark Helpers

+ (NSDictionary *)paramsForRouteType:(TMRouteType)routeType parentItems:(id)parentItems
{
    Class storeClas = nil;
    Class cellClass = nil;
    Class modelClass = nil;
    NSString *vcTitle = nil;
    NSString *viewAL = nil;
    
    switch (routeType) {
            
        case TMRouteType_HomeItem_TableView: {
            storeClas = [ColorsStore class];
            cellClass = [ColorItemTableViewCell class];
            modelClass = [MMJColorItem class];
            vcTitle = NSLocalizedString(@"Colors Title", nil);
            viewAL = NSLocalizedString(@"Colors TableViewController View Accessibility Label", nil);
            break;
        }
            
        case TMRouteType_HomeItem_CollectionView: {
            storeClas = [ColorsStore class];
            cellClass = [ColorItemCollectionViewCell class];
            modelClass = [MMJColorItem class];
            vcTitle = NSLocalizedString(@"Colors Title", nil);
            viewAL = NSLocalizedString(@"Colors CollectionViewController View Accessibility Label", nil);
            break;
        }
            
        case TMRouteType_HomeItem_View:
            return nil;
            
        default:
            return nil;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@(routeType) forKey:TMKEY_ROUTE_TYPE];
    
    if (storeClas) {
        [dict setObject:storeClas forKey:TMKEY_STORE_CLASS];
    }
    if (cellClass) {
        [dict setObject:cellClass forKey:TMKEY_CELL_CLASS];
    }
    if (modelClass) {
        [dict setObject:modelClass forKey:TMKEY_MODEL_CLASS];
    }
    if (parentItems) {
        [dict setObject:parentItems forKey:TMKEY_PARENT_ITEMS];
    }
    if (vcTitle) {
        [dict setObject:vcTitle forKey:TMKEY_VIEW_CONTROLLER_TITLE];
    }
    if (viewAL) {
        [dict setObject:viewAL forKey:TMKEY_VIEW_ACCSESSIBILITY_LABEL];
    }

    return dict;
}



@end
