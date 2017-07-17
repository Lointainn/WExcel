//
//  UpTableViewCell.h
//  MyExcel
//
//  Created by Wu on 2017/7/11.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ButtonDefaultWidth 60
#define ButtonDefaultHeight 30

@interface UpTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, copy) NSString *title;
@end
