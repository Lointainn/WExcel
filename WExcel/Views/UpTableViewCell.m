//
//  UpTableViewCell.m
//  MyExcel
//
//  Created by Wu on 2017/7/11.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "UpTableViewCell.h"

@implementation UpTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
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
