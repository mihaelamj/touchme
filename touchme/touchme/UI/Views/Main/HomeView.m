//
//  HomeView.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView

#pragma mark -
#pragma mark Init

- (instancetype)initWithFrame:(CGRect)frame options:(NSInteger)options
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tableView];
        
        //table view below the image
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
        }];
    }
    return self;
}

#pragma mark -
#pragma mark Public Properties

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        //        _tableView.separatorInset = UIEdgeInsetsZero;
        //        _tableView.separatorColor = [UIColor clearColor];
    }
    
    return _tableView;
}

@end
