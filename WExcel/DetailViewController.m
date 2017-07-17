//
//  DetailViewController.m
//  NewExcel
//
//  Created by Tusky on 2017/7/17.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "DetailViewController.h"
#import "UpTableViewCell.h"
#import "MainCollectionViewFlowLayout.h"

#import "UIButton+block.h"
#import "UIImage+ColorToImage.h"
#import "UITableView+block.h"
#import "UICollectionView+block.h"
#import "UIView+MJExtension.h"

#import "Header.h"
#import <objc/runtime.h>
@interface DetailViewController ()
@property (nonatomic) NSInteger upNum;
@property (nonatomic) NSInteger leftNum;

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *upTableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DetailViewController
- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.upNum = Screen_width / ButtonDefaultWidth;
    self.leftNum = Screen_height / ButtonDefaultHeight;
    
    [self createLeftTableView];
    [self createUpTableView];
    [self createMainCollection];
    
    //    [self createHeadButton];
}

- (void)createLeftTableView {
    __weak typeof(self) wself = self;

    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + ButtonDefaultHeight, ButtonDefaultWidth, self.view.mj_h - 64 - ButtonDefaultHeight) style:UITableViewStylePlain];
    _leftTableView.separatorInset = UIEdgeInsetsZero;
    _leftTableView.bounces = 0;
    [_leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_leftTableView block_cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.textLabel.text = @(indexPath.row + 1).stringValue;
        cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.4 alpha:1];
        return cell;
    }];
    [_leftTableView block_numberOfRowsInSection:^NSInteger(UITableView *tableView, NSInteger section) {
        return wself.leftNum;
    }];
    [_leftTableView block_heightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return ButtonDefaultHeight;
    }];
    [_leftTableView block_didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"%ld",indexPath.row);
        
        if (indexPath.row  + 1 == wself.leftNum) {
            wself.leftNum ++;
        }
    }];
    [_leftTableView block_scrollViewDidScroll:^(UIScrollView *scrollView) {
        if (scrollView == wself.leftTableView) {
            wself.collectionView.contentOffset = CGPointMake(wself.collectionView.contentOffset.x, wself.leftTableView.contentOffset.y);
        }
    }];
    [self.view addSubview:_leftTableView];
}

- (void)createUpTableView {
    __weak typeof(self) wself = self;

    _upTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _upTableView.separatorInset = UIEdgeInsetsZero;
    [_upTableView registerClass:[UpTableViewCell class] forCellReuseIdentifier:@"cell3"];
    _upTableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _upTableView.bounces = 0;
    _upTableView.frame = CGRectMake(ButtonDefaultWidth, 64, self.view.mj_w - ButtonDefaultWidth, ButtonDefaultHeight);
    [_upTableView block_cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        cell.title = [wself getUpTableTitle:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.4 alpha:1];
        return cell;
    }];
    [_upTableView block_numberOfRowsInSection:^NSInteger(UITableView *tableView, NSInteger section) {
        return wself.upNum;
    }];
    [_upTableView block_heightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return ButtonDefaultWidth;
    }];
    [_upTableView block_didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"%ld",indexPath.row);
        if (indexPath.row + 1 == wself.upNum) {
            wself.upNum ++;
        }
    }];
    [_upTableView block_scrollViewDidScroll:^(UIScrollView *scrollView) {
        if (scrollView == wself.upTableView) {
            wself.collectionView.contentOffset = CGPointMake(wself.upTableView.contentOffset.y, wself.collectionView.contentOffset.y);
        }
    }];
    [self.view addSubview:_upTableView];
}

- (void)createMainCollection{
    __weak typeof(self) wself = self;

    MainCollectionViewFlowLayout *layout = [MainCollectionViewFlowLayout new];
    //    layout.itemSize = CGSizeMake(ButtonDefaultWidth, ButtonDefaultHeight-1);
    //    layout.minimumLineSpacing = 0.5;
    //    layout.minimumInteritemSpacing = 0;
    [layout invalidateLayout];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftTableView.frame), CGRectGetMaxY(_upTableView.frame), CGRectGetWidth(_upTableView.frame), CGRectGetHeight(_leftTableView.frame)) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.bounces = 0;
    _collectionView.contentMode = UIViewContentModeScaleAspectFit;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [_collectionView block_cellForItemAtIndexPath:^UICollectionViewCell *(UICollectionView *collectionView1, NSIndexPath *indexPath) {
        UICollectionViewCell *cell = [collectionView1 dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        return cell;
    }];
    [_collectionView block_numberOfItemsInSection:^NSInteger(UICollectionView *collectionView, NSInteger section) {
        layout.contentSize = CGSizeMake(wself.upNum * ButtonDefaultWidth, wself.leftNum * ButtonDefaultHeight);
        return wself.leftNum * wself.upNum;
    }];
    [_collectionView block_didSelectItemAtIndexPath:^(UICollectionView *collectionView, NSIndexPath *indexPath) {
        NSLog(@"%ld",indexPath.item);
    }];
    [_collectionView block_scrollViewDidScroll:^(UIScrollView *scrollView) {
        if (scrollView == wself.collectionView) {
            wself.leftTableView.contentOffset = CGPointMake(0, wself.collectionView.contentOffset.y);
            wself.upTableView.contentOffset = CGPointMake(0,wself.collectionView.contentOffset.x);
        }
    }];
    
    [self.view addSubview:_collectionView];
}

- (void)createHeadButton {
    UIButton *headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    headerButton.frame = CGRectMake(0, 64, ButtonDefaultWidth, ButtonDefaultHeight);
    headerButton.backgroundColor = [UIColor grayColor];
    [headerButton addBlockActionForControlEvents:UIControlEventTouchUpInside block:^(UIButton *button) {
        NSLog(@"被按啦!!!!");
    }];
    [self.view addSubview:headerButton];
}

//转换成26进制
void getQuotient(long index, NSMutableArray *numOf26) {
    short remainder = index % 26;
    [numOf26 addObject:@(remainder)];
    long quotient = index / 26;
    if (quotient == 0) {
        return;
    } else {
        getQuotient(quotient - 1, numOf26);
    }
}
//字母列表头
- (NSString*)getUpTableTitle:(NSIndexPath *)indexPath {
    NSMutableString *title = [NSMutableString string];
    NSMutableArray *numOf26 = [NSMutableArray array];
    getQuotient(indexPath.row, numOf26);
    [numOf26 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [title appendString:[NSString stringWithFormat:@"%c",(char)([numOf26[idx] integerValue] + 65)]];
    }];
    return title.copy;
}

- (void)setUpNum:(NSInteger)upNum {
    _upNum = upNum;
    [_upTableView reloadData];
    [_collectionView reloadData];
}

- (void)setLeftNum:(NSInteger)leftNum {
    _leftNum = leftNum;
    [_leftTableView reloadData];
    [_collectionView reloadData];
}

@end

@interface UICollectionViewCell (mainCollection)
@property (nonatomic, strong) UIView *rightSepLine;
@property (nonatomic, strong) UIView *downSepLine;
@end
@implementation UICollectionViewCell (mainCollection)
- (void)setRightSepLine:(UIView *)rightSepLine {
    objc_setAssociatedObject(self, @selector(rightSepLine), rightSepLine, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setDownSepLine:(UIView *)downSepLine {
    objc_setAssociatedObject(self, @selector(downSepLine), downSepLine, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)rightSepLine {
    UIView * _sep = objc_getAssociatedObject(self, _cmd);
    if (!_sep) {
        _sep = [UIView new];
        [self setRightSepLine:_sep];
        _sep.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_sep];
    }
    return _sep;
}
- (UIView *)downSepLine {
    UIView * _sep = objc_getAssociatedObject(self, _cmd);
    if (!_sep) {
        _sep = [UIView new];
        [self setDownSepLine:_sep];
        _sep.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_sep];
    }
    return _sep;
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.rightSepLine.frame = CGRectMake(self.mj_w - 0.5, 0, 0.5, self.mj_h);
    self.downSepLine.frame = CGRectMake(0, self.mj_h - 0.5, self.mj_w, 0.5);
}
@end

