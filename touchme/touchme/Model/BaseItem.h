//
//  BaseItem.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//block types
#import "BlockTypes.h"

//protocol
//#import "ActionableItem.h"

@interface BaseItem : NSObject//<ActionableItem>

@property (nonatomic, copy) SimpleBlock actionBlock;

@end
