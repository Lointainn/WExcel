//
//  LeftTableViewCell.m
//  WExcel
//
//  Created by Wu on 2017/7/18.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = color_titleBackground;
        
        UIView *selecBgView = [UIView new];
        selecBgView.backgroundColor = color_titleBackgroundSelected;
        self.selectedBackgroundView = selecBgView;
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(0, 0, ButtonDefaultWidth, ButtonDefaultHeight);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
@end
