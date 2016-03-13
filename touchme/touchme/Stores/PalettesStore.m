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
        NSDictionary *params = [PalettesStore paramsForRouteType:routeType];
        palette.actionBlock = ^{
            [TMRoute navigateRouteType:routeType fromViewController:weakController params:params modal:NO];
        };
        
    }
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
            storeClas = [ColorsStore class];
            cellClass = [ColorItemTableViewCell class];
            modelClass = [MMJColorItem class];
            vcTitle = NSLocalizedString(@"Colors Title", nil);
            viewAL = NSLocalizedString(@"Colors TableViewController View Accessibility Label", nil);
        }
            
        case TMRouteType_HomeItem_CollectionView: {
            storeClas = [ColorsStore class];
            cellClass = [ColorItemCollectionViewCell class];
            modelClass = [MMJColorItem class];
            vcTitle = NSLocalizedString(@"Colors Title", nil);
            viewAL = NSLocalizedString(@"Colors CollectionViewController View Accessibility Label", nil);
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
