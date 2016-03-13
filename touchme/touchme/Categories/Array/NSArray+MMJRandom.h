//
//  NSArray+MMJRandom.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MMJRandom)

- (id)randomObject;
- (NSArray *)randomObjects:(NSInteger)count;

@end
