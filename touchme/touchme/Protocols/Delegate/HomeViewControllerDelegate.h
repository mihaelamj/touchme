//
//  HomeViewControllerDelegate.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//needed for UITableViewDelegate to be available
#import <UIKit/UIKit.h>

//model
#import "HomeItem.h"

@interface HomeViewControllerDelegate : NSObject<UITableViewDelegate>

//init
- (instancetype)initWithArray:(NSArray *)array; //of HomeItem

//public properties
@property (nonatomic, weak) NSArray *array; //of HomeItem


@end
