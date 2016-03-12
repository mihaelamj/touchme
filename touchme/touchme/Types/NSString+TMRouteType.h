//
//  NSString+TMRouteType.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TMRouteType)

//enum
#import "TMRouteType.h"

+ (NSString *)nameForRouteType:(TMRouteType)routeType;

@end
