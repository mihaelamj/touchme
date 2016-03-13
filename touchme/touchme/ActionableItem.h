//
//  ActionableItem.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

//block types
#import "BlockTypes.h"

@protocol ActionableItem <NSObject>
@property (nonatomic, copy) SimpleBlock actionBlock;
@end
