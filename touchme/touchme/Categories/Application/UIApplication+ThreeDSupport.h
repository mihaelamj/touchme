//
//  UIApplication+ThreeDSupport.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (ThreeDSupport)

//logic
+ (BOOL)hasUIApplicationShortcutItemClass;
+ (BOOL)isThreeDTouchDevice;

@end
