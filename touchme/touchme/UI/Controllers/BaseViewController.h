//
//  BaseViewController.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) id previewingContext;

@property (nonatomic, getter=isModal) BOOL modal;

- (instancetype)initWithParams:(NSDictionary *)params modal:(BOOL)modal;

//for embedded controllers
@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic) BOOL isEmbeddedController;

@end
