//
//  NSString+HomeItemType.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum
#import "HomeItemType.h"

@interface NSString (HomeItemType)

+ (NSString *)nameForHomeItemType:(HomeItemType)homeItemType;
+ (NSString *)imageNameForHomeItemType:(HomeItemType)homeItemType;

@end
