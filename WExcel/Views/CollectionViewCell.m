//
//  CollectionViewCell.m
//  WExcel
//
//  Created by Wu on 2017/7/18.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Header.h"
@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color_collectionBackground;
        
        UIView *selecBgView = [UIView new];
        selecBgView.backgroundColor = color_collectionBackgroundSelected;
        self.selectedBackgroundView = selecBgView;
    }
    return self;
}

@end
