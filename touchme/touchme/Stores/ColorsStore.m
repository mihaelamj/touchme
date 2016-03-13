//
//  ColorsStore.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "ColorsStore.h"

//vc
#import "BaseItemsViewController.h"

//model
#import "MMJColorItem.h"

@implementation ColorsStore

#pragma mark -
#pragma mark Public Methods

+ (void)itemsWithCompletion:(ArrayCompletionBlock)completion controller:(BaseViewController *)controller
{
    if ([controller isKindOfClass:[BaseItemsViewController class]]) {
        
        __weak BaseViewController *weakController = controller;
        
        BaseItemsViewController *itemsVC = (BaseItemsViewController *)controller;
        
        for (MMJColorItem *colorItem in itemsVC.objects) {
            
            TMRouteType routeType = controller.routeType;
            NSDictionary *params = [ColorsStore paramsForRouteType:routeType parentItems:nil];
            colorItem.actionBlock = ^{
                [TMRoute navigateRouteType:routeType fromViewController:weakController params:params modal:NO];
            };
        }
        
        completion(itemsVC.objects, nil);
        return;
        
    }
    completion(nil, nil);
}

#pragma mark -
#pragma mark Private Methods

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
            vcTitle = NSLocalizedString(@"Color Title", nil);
            viewAL = NSLocalizedString(@"Color ViewController View Accessibility Label", nil);
            break;
        }
            
        case TMRouteType_HomeItem_CollectionView: {
            vcTitle = NSLocalizedString(@"Color Title", nil);
            viewAL = NSLocalizedString(@"Color ViewController View Accessibility Label", nil);
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
