//
//  HomeItem.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum
#import "HomeItemType.h"

//block types
#import "BlockTypes.h"

@interface HomeItem : NSObject

- (instancetype)initWithType:(HomeItemType)type;

+ (NSArray *)itemArray;

@property (nonatomic, readonly) HomeItemType type;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *imageName;

@property (nonatomic,copy) SimpleBlock actionBlock;

@end
