//
//  BaseViewController.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

//params keys
#import "TM_Keys.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) id previewingContext;

@property (nonatomic, getter=isModal) BOOL modal;
@property (nonatomic, strong, readonly) NSDictionary *params;

- (instancetype)initWithParams:(NSDictionary *)params modal:(BOOL)modal;

//public
- (void)handleParams;

//for embedded controllers
@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic) BOOL isEmbeddedController;

@end
