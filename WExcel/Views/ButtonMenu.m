//
//  ButtonMenu.m
//  MyExcel
//
//  Created by Tusky on 2017/6/18.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "ButtonMenu.h"

#define screen_width CGRectGetWidth([UIScreen mainScreen].bounds)
#define screen_height CGRectGetHeight([UIScreen mainScreen].bounds)

@implementation ButtonMenu
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (ButtonMenu*)OnlyMenu {
    static ButtonMenu *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [self new];
    });
    return single;
}

+ (void)showMenuByView:(UIView *)touchedView {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGRect touchedViewFrame = [touchedView.superview convertRect:touchedView.frame toView:window];

    ButtonMenu *menu = [ButtonMenu OnlyMenu];
    [menu removeFromSuperview];
    
    CGFloat x,y,width = 60,height = 100;
    
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
    
    menu.backgroundColor = [UIColor blueColor];
    menu.layer.borderColor = [UIColor blackColor].CGColor;
    menu.layer.borderWidth = 1;
    menu.frame = CGRectMake(x, y, width, height);
    [window addSubview:menu];
}
@end
