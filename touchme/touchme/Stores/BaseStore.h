//
//  BaseStore.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//base VC
#import "BaseViewController.h"

//route
#import "TMRoute.h"
//params keys
#import "TM_Keys.h"
//block types
#import "BlockTypes.h"

@interface BaseStore : NSObject

+ (NSArray *)itemsWithError:(NSError **)error;

+ (NSArray *)itemsWithError:(NSError **)error controller:(BaseViewController *)controller;

+ (void)itemsWithCompletion:(ArrayCompletionBlock)completion controller:(BaseViewController *)controller;


@end
