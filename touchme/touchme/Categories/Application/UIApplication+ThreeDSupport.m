//
//  UIApplication+ThreeDSupport.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "UIApplication+ThreeDSupport.h"

@implementation UIApplication (ThreeDSupport)

#pragma mark -
#pragma mark Public Methods

+ (BOOL)hasUIApplicationShortcutItemClass
{
    Class appShortcutItemClas = [UIApplicationShortcutItem class];
    
    if (appShortcutItemClas && [appShortcutItemClas respondsToSelector:@selector(new)]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isThreeDTouchDevice
{
    if (![UIApplication hasUIApplicationShortcutItemClass]) {
        return NO;
    }
    
    //check for trait collection
    UITraitCollection *traitCollection = [UIScreen mainScreen].traitCollection;
    BOOL hasForceTouch = traitCollection && [traitCollection respondsToSelector:@selector(forceTouchCapability)];
    if (hasForceTouch) {
        BOOL forceTouchAvailable = traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable;
        return forceTouchAvailable;
    }
    
    return NO;
}


@end
