//
//  HomeViewControllerDelegate.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "HomeViewControllerDelegate.h"

//sizes
#import "TMSizes.h"

@implementation HomeViewControllerDelegate

#pragma mark -
#pragma mark Init

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _array = array;
    }
    return self;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHomeItemCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    HomeItem *item = [self homeItemAtIndexPath:indexPath];
    
    if (item) {
        if (item.actionBlock) {
            item.actionBlock();
        } else {
            MMJLog(@"Error: no actionBlock for item at index: %ld", (long)indexPath.row);
        }
    } else {
        MMJLog(@"Error: no item at index: %ld", (long)indexPath.row);
    }
}

#pragma mark -
#pragma mark Private Methods

- (HomeItem *)homeItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeItem *item = nil;
    if ([self.array count] > indexPath.row) {
        item = self.array[(NSUInteger) indexPath.row];
    }
    if ([item isKindOfClass:[HomeItem class]]) {
        return item;
    }
    return nil;
}

@end
