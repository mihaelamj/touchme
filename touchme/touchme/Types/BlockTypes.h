//
//  BlockTypes.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//simple block definition
typedef dispatch_block_t SimpleBlock;

//cell configure block
typedef void (^CellConfigureBlock)(id cell, id item);

