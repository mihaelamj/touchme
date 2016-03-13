//
//  TMRoute.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMRoute.h"

//string helper
#import "NSString+TMRouteType.h"

//controllers
#import "TMTableViewController.h"
#import "TMCollectionViewController.h"
#import "TMPlainViewController.h"

#import "ColorPalettesTableViewController.h"


@implementation TMRoute

#pragma mark -
#pragma mark Init

- (instancetype)initWithType:(TMRouteType)type
{
    self = [super init];
    if (self) {
        _type = type;
        _name = [NSString nameForRouteType:_type];
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)navigateToRouteFromViewController:(BaseViewController *)fromViewController params:(NSDictionary *)params modal:(BOOL)modal
{
    [TMRoute navigateRouteType:self.type fromViewController:fromViewController params:params modal:modal];
}

+ (void)navigateRouteType:(TMRouteType)routeType fromViewController:(BaseViewController *)fromViewController params:(NSDictionary *)params modal:(BOOL)modal
{
    BaseViewController *toViewController = [TMRoute viewControllerForRouteType:routeType params:params modal:modal];
    
    //if fromViewController is embedded VC, present from it's parent
    UIViewController *presenter = (fromViewController.isEmbeddedController && fromViewController.parentController) ? fromViewController.parentController : fromViewController;
    
    if (toViewController.modal) {
        [presenter presentViewController:toViewController animated:YES completion:^{
        }];
        
    } else {
        if (presenter.navigationController) {
            [presenter.navigationController pushViewController:toViewController animated:YES];
        } else {
            [presenter presentViewController:toViewController animated:YES completion:^{
            }];
        }
    }
}

#pragma mark -
#pragma mark Private Methods

+ (BaseViewController *)viewControllerForRouteType:(TMRouteType)routeType params:(NSDictionary *)params modal:(BOOL)modal
{
    switch (routeType) {
            
        case TMRouteType_HomeItem_TableView:
            return [[TMTableViewController alloc] initWithParams:params modal:modal];
        case TMRouteType_HomeItem_CollectionView:
            return [[TMCollectionViewController alloc] initWithParams:params modal:modal];
        case TMRouteType_HomeItem_View:
            return [[TMPlainViewController alloc] initWithParams:params modal:modal];
            
        default:
            return nil;
    }
}

@end
