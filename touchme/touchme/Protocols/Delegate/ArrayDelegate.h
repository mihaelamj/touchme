//
//  ArrayDelegate.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//needed for UITableViewDelegate to be available
#import <UIKit/UIKit.h>

//model
#import "BaseItem.h"

@interface ArrayDelegate : NSObject<UITableViewDelegate, UICollectionViewDelegate>

//init
- (instancetype)initWithArray:(NSArray *)array cellClass:(Class)cellClass; //of BaseItem

//public properties
@property (nonatomic, weak) NSArray *array; //of BaseItem
@property (nonatomic, unsafe_unretained, readwrite) Class cellClass;

@end
