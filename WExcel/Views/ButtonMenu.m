//
//  ButtonMenu.m
//  MyExcel
//
//  Created by Tusky on 2017/6/18.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "ButtonMenu.h"
#import "UITableView+block.h"

#define screen_width CGRectGetWidth([UIScreen mainScreen].bounds)
#define screen_height CGRectGetHeight([UIScreen mainScreen].bounds)

#define menuRowHeight 30
#define defaultWidth  60
@interface MenuTableCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, copy) NSString *title;
@end

@interface ButtonMenu ()
@property (nonatomic, copy) NSArray *menuTitleList;
@property (nonatomic, copy) didSelectedBlock selectHandler;
@end

@implementation ButtonMenu
{
    UITableView *menuTable;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (!menuTable) {
        __weak typeof(self) wself = self;
        menuTable = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [menuTable registerClass:[MenuTableCell class] forCellReuseIdentifier:@"menuCell"];
        menuTable.bounces = 0;
        menuTable.rowHeight = menuRowHeight;
        menuTable.separatorInset = UIEdgeInsetsZero;
        [menuTable block_cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
            MenuTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell"];
            cell.title = wself.titleList[indexPath.row];
            return cell;
        }];
        [menuTable block_numberOfRowsInSection:^NSInteger(UITableView *tableView, NSInteger section) {
            return wself.menuTitleList.count;
        }];
        [menuTable block_didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath) {
            wself.selectHandler(indexPath.row);
            [wself removeFromSuperview];
        }];
        [self addSubview:menuTable];
    } else {
        menuTable.frame = self.bounds;
        [menuTable reloadData];
    }
}

+ (ButtonMenu*)OnlyMenu {
    static ButtonMenu *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [self new];
    });
    return single;
}

+ (void)showMenuByView:(UIView *)touchedView titleList:(NSArray *)titleList selectHandler:(didSelectedBlock)handler{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGRect touchedViewFrame = [touchedView.superview convertRect:touchedView.frame toView:window];

    ButtonMenu *menu = [ButtonMenu OnlyMenu];
    menu.menuTitleList = titleList;
    menu.selectHandler = handler;
    [menu removeFromSuperview];
    
    CGFloat x,y,height = titleList.count > 0 ? titleList.count * menuRowHeight : menuRowHeight;
    __block CGFloat width = defaultWidth;
    [titleList enumerateObjectsUsingBlock:^(NSString *  _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        if (width < size.width) {
            width = size.width;
        }
    }];
    width += 10;
    
    if (CGRectGetMaxX(touchedViewFrame) + width > screen_width) {
        x = screen_width - width;
    } else {
        x = CGRectGetMaxX(touchedViewFrame);
    }
    
    if (CGRectGetMaxY(touchedViewFrame) + height > screen_height) {
        y = screen_height - height;
    } else {
        y = CGRectGetMaxY(touchedViewFrame);
    }
    
    menu.backgroundColor = [UIColor whiteColor];
    menu.layer.borderColor = [UIColor darkGrayColor].CGColor;
    menu.layer.borderWidth = 0.5;
    menu.frame = CGRectMake(x, y, width, height);
    [window addSubview:menu];
}

+ (void)hideMenu {
    ButtonMenu *menu = [ButtonMenu OnlyMenu];
    [menu removeFromSuperview];
}

- (NSArray *)titleList {
    return self.menuTitleList;
}
@end

@implementation MenuTableCell

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.titleLabel.frame = self.bounds;
    if (!self.titleLabel.superview) {
        [self.contentView addSubview:self.titleLabel];
    }
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor darkGrayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
@end
