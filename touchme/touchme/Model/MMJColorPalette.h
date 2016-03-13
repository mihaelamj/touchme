//
//  MMJColorPalette.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//block types
#import "BlockTypes.h"

@interface MMJColorPalette : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSArray *colors;

@property (nonatomic,copy) SimpleBlock actionBlock;

- (instancetype)initWithName:(NSString *)name colors:(NSArray *)colors;

+ (void)itemsWithCompletion:(ArrayCompletionBlock)completion;

@end
