//
//  MMJColorPalette.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseItem.h"

@interface MMJColorPalette : BaseItem

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSArray *colors;

- (instancetype)initWithName:(NSString *)name colors:(NSArray *)colors;

+ (void)itemsWithCompletion:(ArrayCompletionBlock)completion;

@end
