//
//  ViewController.m
//  NewExcel
//
//  Created by Tusky on 2017/7/17.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "UITableView+block.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTable];
    self.title = @"列表";
}

- (void)createTable {
    __weak typeof(self) wself = self;
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [table block_cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.textLabel.text = @(indexPath.row).stringValue;
        return cell;
    }];
    [table block_numberOfRowsInSection:^NSInteger(UITableView *tableView, NSInteger section) {
        return 100;
    }];
    [table block_didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath) {
        DetailViewController *con = [DetailViewController new];
        con.title = @(indexPath.row).stringValue;
        [wself.navigationController pushViewController:con animated:1];
    }];
    [self.view addSubview:table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


