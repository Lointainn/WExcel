//
//  ButtonMenu.h
//  MyExcel
//
//  Created by Tusky on 2017/6/18.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didSelectedBlock)(NSInteger index);

@interface ButtonMenu : UIView

@property (nonatomic, copy, readonly) NSArray *titleList;

+ (ButtonMenu*)OnlyMenu;

+ (void)showMenuByView:(UIView *)touchedView titleList:(NSArray *)titleList selectHandler:(didSelectedBlock)handler;

+ (void)hideMenu;
@end
