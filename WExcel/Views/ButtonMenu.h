//
//  ButtonMenu.h
//  MyExcel
//
//  Created by Tusky on 2017/6/18.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonMenu : UIView

+ (ButtonMenu*)OnlyMenu;

+ (void)showMenuByView:(UIView*)touchedView;
@end
