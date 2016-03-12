//
//  TMRoute.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum
#import "TMRouteType.h"

//VC
#import "BaseViewController.h"

@interface TMRoute : NSObject

- (instancetype)initWithType:(TMRouteType)type;

@property (nonatomic, readonly) TMRouteType type;
@property (nonatomic, strong, readonly) NSString *name;

- (void)navigateToRouteFromViewController:(BaseViewController *)fromViewController params:(NSDictionary *)params modal:(BOOL)modal;

@end
