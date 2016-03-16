//
//  TMCollectionView.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMCollectionView.h"

@implementation TMCollectionView

#pragma mark -
#pragma mark Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.collectionView];
        
        //table view below the image
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
        }];
    }
    return self;
}

#pragma mark -
#pragma mark Private Properties - Views

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        //1st create layout
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        //create collection view with that layout with non-empty frame, otherwise no cells are created
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 100) collectionViewLayout:flowLayout];
        
        //customize collection view
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

@end
