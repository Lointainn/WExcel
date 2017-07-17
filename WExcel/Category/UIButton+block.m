//
//  UIButton+block.m
//  MyExcel
//
//  Created by Tusky on 2017/6/27.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "UIButton+block.h"
#import <objc/runtime.h>
@implementation UIButton (block)
- (void)addBlockActionForControlEvents:(UIControlEvents)controlEvents block:(ActionBlock)block {
    self.actionBlock = block;
    [self addTarget:self action:@selector(blockAction:) forControlEvents:controlEvents];
}

- (void)blockAction:(UIButton*)sender {
    self.actionBlock(sender);
}

- (ActionBlock)actionBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setActionBlock:(ActionBlock)actionBlock {
    objc_setAssociatedObject(self, @selector(actionBlock), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

     
     
@end
