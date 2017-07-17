//
//  UIButton+block.h
//  MyExcel
//
//  Created by Tusky on 2017/6/27.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(UIButton*button);

@interface UIButton (block)

@property (nonatomic, copy) ActionBlock actionBlock;

- (void)addBlockActionForControlEvents:(UIControlEvents)controlEvents block:(ActionBlock)block;

@end
