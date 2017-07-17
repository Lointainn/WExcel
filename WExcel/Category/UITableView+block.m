//
//  UITableView+block.m
//  MyExcel
//
//  Created by Tusky on 2017/7/3.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "UITableView+block.h"
#import <objc/runtime.h>
#import "Header.h"

@interface TableForwarding : NSObject
@end
@implementation TableForwarding
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wprotocol"
@implementation UITableView (block)
#pragma clang diagnostic pop

#pragma mark - Block - WithSelf - UITableViewDataSource
typedef UITableViewCell * (^Block_cellForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSInteger (^Block_numberOfRowsInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef NSInteger (^Block_numberOfSectionsInTableView_WithSelf)(UITableView *tableView);
typedef NSString * (^Block_titleForHeaderInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef NSString * (^Block_titleForFooterInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef BOOL (^Block_canEditRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_canMoveRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSArray<NSString *> * (^Block_sectionIndexTitlesForTableView_WithSelf)(UITableView *tableView);
typedef NSInteger (^Block_sectionForSectionIndexTitle_WithSelf)(UITableView *tableView, NSString *title, NSInteger index);
typedef void (^Block_commitEditingStyle_WithSelf)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);
typedef void (^Block_moveRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);

#pragma mark Block - WithSelf - UITableViewDataSourcePrefetching
typedef void (^Block_prefetchRowsAtIndexPaths_WithSelf)(UITableView *tableView, NSArray<NSIndexPath *> *indexPaths);
typedef void (^Block_cancelPrefetchingForRowsAtIndexPaths_WithSelf)(UITableView *tableView, NSArray<NSIndexPath *> *indexPaths);

#pragma mark Block - WithSelf - UITableViewDelegate
typedef void (^Block_willDisplayCell_WithSelf)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^Block_willDisplayHeaderView_WithSelf)(UITableView *tableView, UIView *view, NSInteger section);
typedef void (^Block_willDisplayFooterView_WithSelf)(UITableView *tableView, UIView *view, NSInteger section);
typedef void (^Block_didEndDisplayingCell_WithSelf)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^Block_didEndDisplayingHeaderView_WithSelf)(UITableView *tableView, UIView *view, NSInteger section);
typedef void (^Block_didEndDisplayingFooterView_WithSelf)(UITableView *tableView, UIView *view, NSInteger section);
typedef CGFloat (^Block_heightForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^Block_heightForHeaderInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef CGFloat (^Block_heightForFooterInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef CGFloat (^Block_estimatedHeightForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^Block_estimatedHeightForHeaderInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef CGFloat (^Block_estimatedHeightForFooterInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef UIView * (^Block_viewForHeaderInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef UIView * (^Block_viewForFooterInSection_WithSelf)(UITableView *tableView, NSInteger section);
typedef void (^Block_accessoryButtonTappedForRowWithIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldHighlightRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didHighlightRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didUnhighlightRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSIndexPath * (^Block_willSelectRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSIndexPath * (^Block_willDeselectRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didSelectRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didDeselectRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef UITableViewCellEditingStyle (^Block_editingStyleForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSString * (^Block_titleForDeleteConfirmationButtonForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSArray<UITableViewRowAction *> * (^Block_editActionsForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldIndentWhileEditingRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_willBeginEditingRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didEndEditingRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSIndexPath * (^Block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath);
typedef NSInteger (^Block_indentationLevelForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldShowMenuForRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_canPerformAction_forRowAtIndexPath_withSender_WithSelf)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender);
typedef void (^Block_performAction_forRowAtIndexPath_withSender_WithSelf)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender);
typedef BOOL (^Block_canFocusRowAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldUpdateFocusInContext_WithSelf)(UITableView *tableView, UITableViewFocusUpdateContext *context);
typedef void (^Block_didUpdateFocusInContext_withAnimationCoordinator_WithSelf)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator);
typedef NSIndexPath * (^Block_indexPathForPreferredFocusedViewInTableView_WithSelf)(UITableView *tableView);

#pragma mark Block - WithSelf - UITableViewDragDelegate
typedef NSArray<UIDragItem *> * (^Block_itemsForBeginningDragSession_atIndexPath_WithSelf)(UITableView *tableView, id<UIDragSession> session, NSIndexPath *indexPath);
typedef NSArray<UIDragItem *> * (^Block_itemsForAddingToDragSession_atIndexPath_point_WithSelf)(UITableView *tableView, id<UIDragSession> session, NSIndexPath *indexPath , CGPoint point);
typedef UIDragPreviewParameters * (^Block_dragPreviewParametersForItemAtIndexPath_WithSelf)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_dragSessionWillBegin_WithSelf)(UITableView *tableView, id<UIDragSession> session);
typedef void (^Block_dragSessionDidEnd_WithSelf)(UITableView *tableView, id<UIDragSession> session);
typedef BOOL (^Block_dragSessionAllowsMoveOperation_WithSelf)(UITableView *tableView, id<UIDragSession> session);
typedef BOOL (^Block_dragSessionIsRestrictedToDraggingApplication_WithSelf)(UITableView *tableView, id<UIDragSession> session);

#pragma mark Block - WithSelf - UITableViewDropDelegate
typedef void (^Block_performDropWithCoordinator_WithSelf)(UITableView *tableView, id<UITableViewDropCoordinator> coordinator);
typedef BOOL (^Block_canHandleDropSession_WithSelf)(UITableView *tableView, id<UIDragSession> session);
typedef void (^Block_dropSessionDidEnter_WithSelf)(UITableView *tableView, id<UIDragSession> session);
typedef UITableViewDropProposal * (^Block_dropSessionDidUpdate_withDestinationIndexPath_WithSelf)(UITableView *tableView, id<UIDragSession> session, NSIndexPath *destinationIndexPath);
typedef void (^Block_dropSessionDidExit_WithSelf)(UITableView *tableView, id<UIDragSession> session);
typedef void (^Block_dropSessionDidEnd_WithSelf)(UITableView *tableView, id<UIDragSession> session);

#pragma mark Block - WithSelf - UIScrollViewDelegate
typedef void(^Block_scrollViewDidScroll_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidZoom_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewWillBeginDragging_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewWillEndDragging_withVelocity_targetContentOffset_WithSelf)(UIScrollView *scrollView, CGPoint velocity, CGPoint *targetContentOffset);
typedef void(^Block_scrollViewDidEndDragging_WithSelf)(UIScrollView *scrollView, BOOL decelerate);
typedef void(^Block_scrollViewWillBeginDecelerating_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidEndDecelerating_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidEndScrollingAnimation_WithSelf)(UIScrollView *scrollView);
typedef UIView *(^Block_viewForZoomingInScrollView_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewWillBeginZooming_WithSelf)(UIScrollView *scrollView, UIView *view);
typedef void(^Block_scrollViewDidEndZooming_WithSelf)(UIScrollView *scrollView, UIView *view, CGFloat scale);
typedef BOOL(^Block_scrollViewShouldScrollToTop_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidScrollToTop_WithSelf)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidChangeAdjustedContentInset_WithSelf)(UIScrollView *scrollView);

#pragma mark - 处理 -

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
+ (void)load {
    
    Method fromMethod1 = class_getInstanceMethod([self class], @selector(layoutSubviews));
    Method toMethod1 = class_getInstanceMethod([self class], @selector(swizzlingLayoutSubviews));
    method_exchangeImplementations(fromMethod1, toMethod1);
    
    Method fromMethod2 = class_getInstanceMethod([self class], @selector(drawRect:));
    Method toMethod2 = class_getInstanceMethod([self class], @selector(swizzlingDrawRect:));
    method_exchangeImplementations(fromMethod2, toMethod2);
    
    Method fromMethod3 = class_getInstanceMethod([self class], @selector(willMoveToWindow:));
    Method toMethod3 = class_getInstanceMethod([self class], @selector(swizzlingWillMoveToWindow:));
    method_exchangeImplementations(fromMethod3, toMethod3);
    
    [self addPropertyFromProtocol:@protocol(UITableViewDataSource)];
    [self addPropertyFromProtocol:@protocol(UITableViewDelegate)];
    [self addPropertyFromProtocol:@protocol(UITableViewDataSourcePrefetching)];
    [self addPropertyFromProtocol:@protocol(UITableViewDragDelegate)];
    [self addPropertyFromProtocol:@protocol(UITableViewDropDelegate)];
    [self addPropertyFromProtocol:@protocol(UIScrollViewDelegate)];
}

+ (void)addPropertyFromProtocol:(Protocol*)protocol {
    [self addPropertyFromProtocol:protocol isRequiredMethod:1];
    [self addPropertyFromProtocol:protocol isRequiredMethod:0];
}

+ (void)addPropertyFromProtocol:(Protocol*)protocol isRequiredMethod:(BOOL)isRequired {
    unsigned int count;
    struct objc_method_description *description = protocol_copyMethodDescriptionList(protocol, isRequired, 1, &count);
    for (int i = 0; i < count ; i++) {
        const char *protocolMethodName = sel_getName(description[i].name);
        NSString *propertyName = [self getPropertyNameFromProtocolSelectorName:[NSString stringWithUTF8String:protocolMethodName]];
        if (propertyName) {
            
            //增加不带self变量的 block Property
            [self addBlockProperty:propertyName];
            
            //增加带self变量的 block Property
            propertyName = [propertyName stringByAppendingString:@"_withSelf"];
            [self addBlockProperty:propertyName];
        }
    }
    free(description);
}

//自动添加property 传入一个变量名如:  numberOfRowsInSectionBlock
+ (void)addBlockProperty:(NSString *)name {
    
    NSString *key = [NSString stringWithFormat:@"%p_%@",self,name];
    
    //set
    id setBlock = ^(id self, id sender){
        objc_setAssociatedObject(self, (__bridge void*)key, sender, OBJC_ASSOCIATION_COPY_NONATOMIC);
    };
    class_addMethod([UITableView class], NSSelectorFromString([self getSetNameFromPropertyName:name]), imp_implementationWithBlock(setBlock), "v@?");
    
    //get
    id getBlock = ^id(id self){
        return objc_getAssociatedObject(self, (__bridge void*)key);
    };
    class_addMethod([UITableView class], NSSelectorFromString(name), imp_implementationWithBlock(getBlock), "?@");
}

//把protocol里面的方法名转化为变量方法 例如:table:numberOfRowsInSection: -> numberOfRowsInSectionBlock
+ (NSString *)getPropertyNameFromProtocolSelectorName:(NSString *)selecstorName {
    NSMutableString *aSelectorString = [NSMutableString stringWithString:selecstorName];
    if (![aSelectorString containsString:@"_"]) {
        if ([aSelectorString containsString:@"ableView"] || [aSelectorString containsString:@"crollView"]) {
            if ([aSelectorString containsString:@"tableView:"]) {
                [aSelectorString deleteCharactersInRange:[aSelectorString rangeOfString:@"tableView:"]];
            }
            if ([aSelectorString containsString:@"scrollView:"]) {
                [aSelectorString deleteCharactersInRange:[aSelectorString rangeOfString:@"scrollView:"]];
            }
            [aSelectorString deleteCharactersInRange:NSMakeRange(aSelectorString.length-1, 1)];
            [aSelectorString replaceOccurrencesOfString:@":" withString:@"_" options:NSCaseInsensitiveSearch range:NSMakeRange(0, aSelectorString.length)];
            [aSelectorString appendString:@"Block"];
            return aSelectorString;
        }
    }
    return nil;
}

//把Property名字改为set方法的名字 例如numberOfRowsInSectionBlock -> setNumberOfRowsInSectionBlock
+ (NSString *)getSetNameFromPropertyName:(NSString*)name {
    
    //第一个字母转为大写字母
    if ([name characterAtIndex:0] >= 97 && [name characterAtIndex:0] <= 122) {
        name = [name stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[NSString stringWithFormat:@"%c", [name characterAtIndex:0] - 32]];
    }
    name = [@"set" stringByAppendingString:name];
    if (![name containsString:@":"]) {
        name = [name stringByAppendingString:@":"];
    }
    return name;
}

- (void)swizzlingWillMoveToWindow: (UIWindow *)newWindow {
    if (newWindow && [self isKindOfClass:[UITableView class]]) {
        [self swizzlingWillMoveToWindow:newWindow];
        [self setDelegates];
    }
}

- (void)swizzlingLayoutSubviews {
    [self swizzlingLayoutSubviews];
    [self setDelegates];
}

- (void)swizzlingDrawRect:(CGRect)rect {
    [self swizzlingDrawRect:rect];
    [self setDelegates];
}

- (void)setDelegates {
    
    self.delegate = self.delegate ?: self;
    self.dataSource = self.dataSource ?: self;
    
    if (@available(iOS 10.0, *)) {
        self.prefetchDataSource = self.prefetchDataSource ?: self;
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    //这一段用来替代判断self.numberOfRowsInSectionBlock是否被实现
    NSString *aSelectorString = [[self class] getPropertyNameFromProtocolSelectorName:NSStringFromSelector(aSelector)];
    if (aSelectorString) {
        //此处使用 instancesRespondToSelector 来先判断是否可以执行此方法,如果用 canPerform 会再次执行respondsToSelector 会导致死循环
        if ([UITableView instancesRespondToSelector:NSSelectorFromString(aSelectorString)] &&
            [self performSelector:NSSelectorFromString(aSelectorString)]) {
            
            aSelectorString = [aSelectorString stringByAppendingString:@"_withSelf"];
            id propertyBlockWithSelf = [self performSelector:NSSelectorFromString(aSelectorString)];
            const char *typeEncoding = method_getTypeEncoding(class_getInstanceMethod([self class], aSelector));
            class_addMethod([TableForwarding class], aSelector, imp_implementationWithBlock(propertyBlockWithSelf), typeEncoding);
            return self.forwardingManager;
            
        } else {
            return [super forwardingTargetForSelector:aSelector];
        }
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    
    if (![self isKindOfClass:[UITableView class]]) {
        return [super respondsToSelector:aSelector];
    }
    
    if (self.delegate || self.dataSource) {
        
        NSString *aSelectorString = [[self class] getPropertyNameFromProtocolSelectorName:NSStringFromSelector(aSelector)];
        if (aSelectorString) {
            
            //相当于执行get方法 [self performSelector:NSSelectorFromString(aSelectorString)]
            //此处使用 instancesRespondToSelector 来先判断是否可以执行此方法,如果用 canPerform 会再次执行respondsToSelector 会导致死循环
            if ([UITableView instancesRespondToSelector:NSSelectorFromString(aSelectorString)] &&
                [self performSelector:NSSelectorFromString(aSelectorString)]) {
                return 1;
            }
        }
    }
    return [super respondsToSelector:aSelector];
}

#pragma mark - Block - UITableViewDataSource

//转换方法名为变量名 再返回含self变量的block的set方法名
//block_numberOfRowsInSection->setNumberOfRowsInSectionBlock
- (NSString *)getSetNameFromBlockSel:(SEL)sel andSetProperty:(id)block{
    NSMutableString *selString = [NSMutableString stringWithString:NSStringFromSelector(sel)];
    [selString stringByReplacingOccurrencesOfString:@"block_" withString:@""];
    [selString deleteCharactersInRange:NSMakeRange(0, 6)];
    [selString insertString:@"Block" atIndex:selString.length - 1];
    selString =  [[self class]getSetNameFromPropertyName:selString.copy].mutableCopy;
    //执行不含self变量的block的set方法
    if ([[self class] instancesRespondToSelector:NSSelectorFromString(selString)]) {
        [self performSelector:NSSelectorFromString(selString.copy) withObject:block];
    }
    [selString insertString:@"_withSelf" atIndex:selString.length - 1];
    return selString;
}
- (void)block_cellForRowAtIndexPath:(Block_cellForRowAtIndexPath)block {
    //执行不含self变量的block的set方法,且返回含self变量的block的set方法名
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    //执行含self变量的block的set方法
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UITableViewCell * (id self, UITableView *tableView, NSIndexPath *indexPath) {
         Block_cellForRowAtIndexPath blockk = (Block_cellForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"cellForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_numberOfRowsInSection:(Block_numberOfRowsInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSInteger (id self, UITableView *tableView, NSInteger section) {
        Block_numberOfRowsInSection blockk = (Block_numberOfRowsInSection)[tableView performSelector:NSSelectorFromString(@"numberOfRowsInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_numberOfSectionsInTableView:(Block_numberOfSectionsInTableView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSInteger (id self, UITableView *tableView) {
        Block_numberOfSectionsInTableView blockk = (Block_numberOfSectionsInTableView)[tableView performSelector:NSSelectorFromString(@"numberOfSectionsInTableViewBlock")];
        return blockk(tableView);
    }];
}
- (void)block_titleForHeaderInSection:(Block_titleForHeaderInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSString * (id self, UITableView *tableView, NSInteger section) {
        Block_titleForHeaderInSection blockk = (Block_titleForHeaderInSection)[tableView performSelector:NSSelectorFromString(@"titleForHeaderInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_titleForFooterInSection:(Block_titleForFooterInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSString * (id self, UITableView *tableView, NSInteger section) {
        Block_titleForFooterInSection blockk = (Block_titleForFooterInSection)[tableView performSelector:NSSelectorFromString(@"titleForFooterInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_canEditRowAtIndexPath:(Block_canEditRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_canEditRowAtIndexPath blockk = (Block_canEditRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"canEditRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_canMoveRowAtIndexPath:(Block_canMoveRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_canMoveRowAtIndexPath blockk = (Block_canMoveRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"canMoveRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_sectionIndexTitlesForTableView:(Block_sectionIndexTitlesForTableView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<NSString *> * (id self, UITableView *tableView) {
        Block_sectionIndexTitlesForTableView blockk = (Block_sectionIndexTitlesForTableView)[tableView performSelector:NSSelectorFromString(@"sectionIndexTitlesForTableViewBlock")];
        return blockk(tableView);
    }];
}
- (void)block_sectionForSectionIndexTitle:(Block_sectionForSectionIndexTitle)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSString *title, NSInteger index) {
        Block_sectionForSectionIndexTitle blockk = (Block_sectionForSectionIndexTitle)[tableView performSelector:NSSelectorFromString(@"sectionForSectionIndexTitleBlock")];
        blockk(tableView, title, index);
    }];
}
- (void)block_commitEditingStyle:(Block_commitEditingStyle)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath) {
        Block_commitEditingStyle blockk = (Block_commitEditingStyle)[tableView performSelector:NSSelectorFromString(@"commitEditingStyleBlock")];
        blockk(tableView, editingStyle, indexPath);
    }];
}
- (void)block_moveRowAtIndexPath:(Block_moveRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath) {
        Block_moveRowAtIndexPath blockk = (Block_moveRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"moveRowAtIndexPathBlock")];
        blockk(tableView, sourceIndexPath, destinationIndexPath);
    }];
}

#pragma mark Block - UITableViewDataSourcePrefetching

- (void)block_prefetchRowsAtIndexPaths:(Block_prefetchRowsAtIndexPaths)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSArray<NSIndexPath *> *indexPaths) {
        Block_prefetchRowsAtIndexPaths blockk = (Block_prefetchRowsAtIndexPaths)[tableView performSelector:NSSelectorFromString(@"prefetchRowsAtIndexPathsBlock")];
        blockk(tableView, indexPaths);
    }];
}
- (void)block_cancelPrefetchingForRowsAtIndexPaths:(Block_cancelPrefetchingForRowsAtIndexPaths)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSArray<NSIndexPath *> *indexPaths) {
        Block_cancelPrefetchingForRowsAtIndexPaths blockk = (Block_cancelPrefetchingForRowsAtIndexPaths)[tableView performSelector:NSSelectorFromString(@"cancelPrefetchingForRowsAtIndexPathsBlock")];
        blockk(tableView, indexPaths);
    }];
}

#pragma mark Block - UITableViewDelegate

- (void)block_willDisplayCell:(Block_willDisplayCell)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath) {
        Block_willDisplayCell blockk = (Block_willDisplayCell)[tableView performSelector:NSSelectorFromString(@"willDisplayCellBlock")];
        blockk(tableView, cell, indexPath);
    }];
}
- (void)block_willDisplayHeaderView:(Block_willDisplayHeaderView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UIView *view, NSInteger section) {
        Block_willDisplayHeaderView blockk = (Block_willDisplayHeaderView)[tableView performSelector:NSSelectorFromString(@"willDisplayHeaderViewBlock")];
        blockk(tableView, view, section);
    }];
}
- (void)block_willDisplayFooterView:(Block_willDisplayFooterView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UIView *view, NSInteger section) {
        Block_willDisplayFooterView blockk = (Block_willDisplayFooterView)[tableView performSelector:NSSelectorFromString(@"willDisplayFooterViewBlock")];
        blockk(tableView, view, section);
    }];
}
- (void)block_didEndDisplayingCell:(Block_didEndDisplayingCell)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath) {
        Block_didEndDisplayingCell blockk = (Block_didEndDisplayingCell)[tableView performSelector:NSSelectorFromString(@"didEndDisplayingCellBlock")];
        blockk(tableView, cell, indexPath);
    }];
}
- (void)block_didEndDisplayingHeaderView:(Block_didEndDisplayingHeaderView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UIView *view, NSInteger section) {
        Block_didEndDisplayingHeaderView blockk = (Block_didEndDisplayingHeaderView)[tableView performSelector:NSSelectorFromString(@"didEndDisplayingHeaderViewBlock")];
        blockk(tableView, view, section);
    }];
}
- (void)block_didEndDisplayingFooterView:(Block_didEndDisplayingFooterView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UIView *view, NSInteger section) {
        Block_didEndDisplayingFooterView blockk = (Block_didEndDisplayingFooterView)[tableView performSelector:NSSelectorFromString(@"didEndDisplayingFooterViewBlock")];
        blockk(tableView, view, section);
    }];
}
- (void)block_heightForRowAtIndexPath:(Block_heightForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_heightForRowAtIndexPath blockk = (Block_heightForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"heightForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_heightForHeaderInSection:(Block_heightForHeaderInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UITableView *tableView, NSInteger section) {
        Block_heightForHeaderInSection blockk = (Block_heightForHeaderInSection)[tableView performSelector:NSSelectorFromString(@"heightForHeaderInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_heightForFooterInSection:(Block_heightForFooterInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UITableView *tableView, NSInteger section) {
        Block_heightForFooterInSection blockk = (Block_heightForFooterInSection)[tableView performSelector:NSSelectorFromString(@"heightForFooterInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_estimatedHeightForRowAtIndexPath:(Block_estimatedHeightForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_estimatedHeightForRowAtIndexPath blockk = (Block_estimatedHeightForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"estimatedHeightForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_estimatedHeightForHeaderInSection:(Block_estimatedHeightForHeaderInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UITableView *tableView, NSInteger section) {
        Block_estimatedHeightForHeaderInSection blockk = (Block_estimatedHeightForHeaderInSection)[tableView performSelector:NSSelectorFromString(@"estimatedHeightForHeaderInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_estimatedHeightForFooterInSection:(Block_estimatedHeightForFooterInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UITableView *tableView, NSInteger section) {
        Block_estimatedHeightForFooterInSection blockk = (Block_estimatedHeightForFooterInSection)[tableView performSelector:NSSelectorFromString(@"estimatedHeightForFooterInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_viewForHeaderInSection:(Block_viewForHeaderInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UIView * (id self, UITableView *tableView, NSInteger section) {
        Block_viewForHeaderInSection blockk = (Block_viewForHeaderInSection)[tableView performSelector:NSSelectorFromString(@"viewForHeaderInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_viewForFooterInSection:(Block_viewForFooterInSection)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UIView * (id self, UITableView *tableView, NSInteger section) {
        Block_viewForFooterInSection blockk = (Block_viewForFooterInSection)[tableView performSelector:NSSelectorFromString(@"viewForFooterInSectionBlock")];
        return blockk(tableView, section);
    }];
}
- (void)block_accessoryButtonTappedForRowWithIndexPath:(Block_accessoryButtonTappedForRowWithIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_accessoryButtonTappedForRowWithIndexPath blockk = (Block_accessoryButtonTappedForRowWithIndexPath)[tableView performSelector:NSSelectorFromString(@"accessoryButtonTappedForRowWithIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_shouldHighlightRowAtIndexPath:(Block_shouldHighlightRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_shouldHighlightRowAtIndexPath blockk = (Block_shouldHighlightRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"shouldHighlightRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_didHighlightRowAtIndexPath:(Block_didHighlightRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_didHighlightRowAtIndexPath blockk = (Block_didHighlightRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"didHighlightRowAtIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_didUnhighlightRowAtIndexPath:(Block_didUnhighlightRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_didUnhighlightRowAtIndexPath blockk = (Block_didUnhighlightRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"didUnhighlightRowAtIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_willSelectRowAtIndexPath:(Block_willSelectRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath * (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_willSelectRowAtIndexPath blockk = (Block_willSelectRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"willSelectRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_willDeselectRowAtIndexPath:(Block_willDeselectRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath * (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_willDeselectRowAtIndexPath blockk = (Block_willDeselectRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"willDeselectRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_didSelectRowAtIndexPath:(Block_didSelectRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_didSelectRowAtIndexPath blockk = (Block_didSelectRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"didSelectRowAtIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_didDeselectRowAtIndexPath:(Block_didDeselectRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_didDeselectRowAtIndexPath blockk = (Block_didDeselectRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"didDeselectRowAtIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_editingStyleForRowAtIndexPath:(Block_editingStyleForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UITableViewCellEditingStyle (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_editingStyleForRowAtIndexPath blockk = (Block_editingStyleForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"editingStyleForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_titleForDeleteConfirmationButtonForRowAtIndexPath:(Block_titleForDeleteConfirmationButtonForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSString * (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_titleForDeleteConfirmationButtonForRowAtIndexPath blockk = (Block_titleForDeleteConfirmationButtonForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"titleForDeleteConfirmationButtonForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_editActionsForRowAtIndexPath:(Block_editActionsForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<UITableViewRowAction *> * (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_editActionsForRowAtIndexPath blockk = (Block_editActionsForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"editActionsForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_shouldIndentWhileEditingRowAtIndexPath:(Block_shouldIndentWhileEditingRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_shouldIndentWhileEditingRowAtIndexPath blockk = (Block_shouldIndentWhileEditingRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"shouldIndentWhileEditingRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_willBeginEditingRowAtIndexPath:(Block_willBeginEditingRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_willBeginEditingRowAtIndexPath blockk = (Block_willBeginEditingRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"willBeginEditingRowAtIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_didEndEditingRowAtIndexPath:(Block_didEndEditingRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_didEndEditingRowAtIndexPath blockk = (Block_didEndEditingRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"didEndEditingRowAtIndexPathBlock")];
        blockk(tableView, indexPath);
    }];
}
- (void)block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath:(Block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath * (id self, UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath) {
        Block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath blockk = (Block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath)[tableView performSelector:NSSelectorFromString(@"targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPathBlock")];
        return blockk(tableView, sourceIndexPath, proposedDestinationIndexPath);
    }];
}
- (void)block_indentationLevelForRowAtIndexPath:(Block_indentationLevelForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSInteger (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_indentationLevelForRowAtIndexPath blockk = (Block_indentationLevelForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"indentationLevelForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_shouldShowMenuForRowAtIndexPath:(Block_shouldShowMenuForRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_shouldShowMenuForRowAtIndexPath blockk = (Block_shouldShowMenuForRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"shouldShowMenuForRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_canPerformAction_forRowAtIndexPath_withSender:(Block_canPerformAction_forRowAtIndexPath_withSender)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender) {
        Block_canPerformAction_forRowAtIndexPath_withSender blockk = (Block_canPerformAction_forRowAtIndexPath_withSender)[tableView performSelector:NSSelectorFromString(@"canPerformAction_forRowAtIndexPath_withSenderBlock")];
        return blockk(tableView, action, indexPath, sender);
    }];
}
- (void)block_performAction_forRowAtIndexPath_withSender:(Block_performAction_forRowAtIndexPath_withSender)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender) {
        Block_performAction_forRowAtIndexPath_withSender blockk = (Block_performAction_forRowAtIndexPath_withSender)[tableView performSelector:NSSelectorFromString(@"performAction_forRowAtIndexPath_withSenderBlock")];
        blockk(tableView, action, indexPath, sender);
    }];
}
- (void)block_canFocusRowAtIndexPath:(Block_canFocusRowAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_canFocusRowAtIndexPath blockk = (Block_canFocusRowAtIndexPath)[tableView performSelector:NSSelectorFromString(@"canFocusRowAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_shouldUpdateFocusInContext:(Block_shouldUpdateFocusInContext)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, UITableViewFocusUpdateContext *context) {
        Block_shouldUpdateFocusInContext blockk = (Block_shouldUpdateFocusInContext)[tableView performSelector:NSSelectorFromString(@"shouldUpdateFocusInContextBlock")];
        return blockk(tableView, context);
    }];
}
- (void)block_didUpdateFocusInContext_withAnimationCoordinator:(Block_didUpdateFocusInContext_withAnimationCoordinator)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator) {
        Block_didUpdateFocusInContext_withAnimationCoordinator blockk = (Block_didUpdateFocusInContext_withAnimationCoordinator)[tableView performSelector:NSSelectorFromString(@"didUpdateFocusInContext_withAnimationCoordinatorBlock")];
        blockk(tableView, context, coordinator);
    }];
}
- (void)block_indexPathForPreferredFocusedViewInTableView:(Block_indexPathForPreferredFocusedViewInTableView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath * (id self, UITableView *tableView) {
        Block_indexPathForPreferredFocusedViewInTableView blockk = (Block_indexPathForPreferredFocusedViewInTableView)[tableView performSelector:NSSelectorFromString(@"indexPathForPreferredFocusedViewInTableViewBlock")];
        return blockk(tableView);
    }];
}
#pragma mark InterfaceMethod - UITableViewDragDelegate
- (void)block_itemsForBeginningDragSession_atIndexPath:(Block_itemsForBeginningDragSession_atIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<UIDragItem *> * (id self, UITableView *tableView, id<UIDragSession> session, NSIndexPath *indexPath) {
        Block_itemsForBeginningDragSession_atIndexPath blockk = (Block_itemsForBeginningDragSession_atIndexPath)[tableView performSelector:NSSelectorFromString(@"itemsForBeginningDragSession_atIndexPathBlock")];
        return blockk(tableView, session, indexPath);
    }];
}
- (void)block_itemsForAddingToDragSession_atIndexPath_point:(Block_itemsForAddingToDragSession_atIndexPath_point)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<UIDragItem *> * (id self, UITableView *tableView, id<UIDragSession> session, NSIndexPath *indexPath , CGPoint point) {
        Block_itemsForAddingToDragSession_atIndexPath_point blockk = (Block_itemsForAddingToDragSession_atIndexPath_point)[tableView performSelector:NSSelectorFromString(@"itemsForAddingToDragSession_atIndexPath_pointBlock")];
        return blockk(tableView, session, indexPath, point);
    }];
}
- (void)block_dragPreviewParametersForItemAtIndexPath:(Block_dragPreviewParametersForItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UIDragPreviewParameters * (id self, UITableView *tableView, NSIndexPath *indexPath) {
        Block_dragPreviewParametersForItemAtIndexPath blockk = (Block_dragPreviewParametersForItemAtIndexPath)[tableView performSelector:NSSelectorFromString(@"dragPreviewParametersForItemAtIndexPathBlock")];
        return blockk(tableView, indexPath);
    }];
}
- (void)block_dragSessionWillBegin:(Block_dragSessionWillBegin)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_dragSessionWillBegin blockk = (Block_dragSessionWillBegin)[tableView performSelector:NSSelectorFromString(@"dragSessionWillBeginBlock")];
        blockk(tableView, session);
    }];
}
- (void)block_dragSessionDidEnd:(Block_dragSessionDidEnd)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_dragSessionDidEnd blockk = (Block_dragSessionDidEnd)[tableView performSelector:NSSelectorFromString(@"dragSessionDidEndBlock")];
        blockk(tableView, session);
    }];
}
- (void)block_dragSessionAllowsMoveOperation:(Block_dragSessionAllowsMoveOperation)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_dragSessionAllowsMoveOperation blockk = (Block_dragSessionAllowsMoveOperation)[tableView performSelector:NSSelectorFromString(@"dragSessionAllowsMoveOperationBlock")];
        return blockk(tableView, session);
    }];
}
- (void)block_dragSessionIsRestrictedToDraggingApplication:(Block_dragSessionIsRestrictedToDraggingApplication)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_dragSessionIsRestrictedToDraggingApplication blockk = (Block_dragSessionIsRestrictedToDraggingApplication)[tableView performSelector:NSSelectorFromString(@"dragSessionIsRestrictedToDraggingApplicationBlock")];
        return blockk(tableView, session);
    }];
}

#pragma mark InterfaceMethod - UITableViewDropDelegate
- (void)block_performDropWithCoordinator:(Block_performDropWithCoordinator)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, id<UITableViewDropCoordinator> coordinator) {
        Block_performDropWithCoordinator blockk = (Block_performDropWithCoordinator)[tableView performSelector:NSSelectorFromString(@"performDropWithCoordinatorBlock")];
        blockk(tableView, coordinator);
    }];
}
- (void)block_canHandleDropSession:(Block_canHandleDropSession)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_canHandleDropSession blockk = (Block_canHandleDropSession)[tableView performSelector:NSSelectorFromString(@"canHandleDropSessionBlock")];
        return blockk(tableView, session);
    }];
}
- (void)block_dropSessionDidEnter:(Block_dropSessionDidEnter)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, id<UIDragSession> session, NSIndexPath *destinationIndexPath) {
        Block_dropSessionDidEnter blockk = (Block_dropSessionDidEnter)[tableView performSelector:NSSelectorFromString(@"dropSessionDidEnterBlock")];
        blockk(tableView, session);
    }];
}
- (void)block_dropSessionDidUpdate_withDestinationIndexPath:(Block_dropSessionDidUpdate_withDestinationIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UITableViewDropProposal * (id self, UITableView *tableView, id<UIDragSession> session, NSIndexPath *destinationIndexPath) {
        Block_dropSessionDidUpdate_withDestinationIndexPath blockk = (Block_dropSessionDidUpdate_withDestinationIndexPath)[tableView performSelector:NSSelectorFromString(@"dropSessionDidUpdate_withDestinationIndexPathBlock")];
        return blockk(tableView, session, destinationIndexPath);
    }];
    
}
- (void)block_dropSessionDidExit:(Block_dropSessionDidExit)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_dropSessionDidExit blockk = (Block_dropSessionDidExit)[tableView performSelector:NSSelectorFromString(@"dropSessionDidExitBlock")];
        blockk(tableView, session);
    }];
}
- (void)block_dropSessionDidEnd:(Block_dropSessionDidEnd)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UITableView *tableView, id<UIDragSession> session) {
        Block_dropSessionDidEnd blockk = (Block_dropSessionDidEnd)[tableView performSelector:NSSelectorFromString(@"dropSessionDidEndBlock")];
        blockk(tableView, session);
    }];
}

#pragma mark InterfaceMethod - UIScrollViewDelegate

- (void)block_scrollViewDidScroll:(Block_scrollViewDidScroll)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewDidScroll blockk = (Block_scrollViewDidScroll)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidScrollBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewDidZoom:(Block_scrollViewDidZoom)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewDidZoom blockk = (Block_scrollViewDidZoom)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidZoomBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewWillBeginDragging:(Block_scrollViewWillBeginDragging)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewWillBeginDragging blockk = (Block_scrollViewWillBeginDragging)[scrollView performSelector:NSSelectorFromString(@"scrollViewWillBeginDraggingBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewWillEndDragging_withVelocity_targetContentOffset:(Block_scrollViewWillEndDragging_withVelocity_targetContentOffset)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView, CGPoint velocity, CGPoint *targetContentOffset) {
        Block_scrollViewWillEndDragging_withVelocity_targetContentOffset blockk = (Block_scrollViewWillEndDragging_withVelocity_targetContentOffset)[scrollView performSelector:NSSelectorFromString(@"scrollViewWillEndDragging_withVelocity_targetContentOffsetBlock")];
        return blockk(scrollView, velocity, targetContentOffset);
    }];
}
- (void)block_scrollViewDidEndDragging:(Block_scrollViewDidEndDragging)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView, BOOL decelerate) {
        Block_scrollViewDidEndDragging blockk = (Block_scrollViewDidEndDragging)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidEndDraggingBlock")];
        return blockk(scrollView, decelerate);
    }];
}
- (void)block_scrollViewWillBeginDecelerating:(Block_scrollViewWillBeginDecelerating)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewWillBeginDecelerating blockk = (Block_scrollViewWillBeginDecelerating)[scrollView performSelector:NSSelectorFromString(@"scrollViewWillBeginDeceleratingBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewDidEndDecelerating:(Block_scrollViewDidEndDecelerating)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewDidEndDecelerating blockk = (Block_scrollViewDidEndDecelerating)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidEndDeceleratingBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewDidEndScrollingAnimation:(Block_scrollViewDidEndScrollingAnimation)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewDidEndScrollingAnimation blockk = (Block_scrollViewDidEndScrollingAnimation)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidEndScrollingAnimationBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_viewForZoomingInScrollView:(Block_viewForZoomingInScrollView)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UIView * (id self, UIScrollView *scrollView) {
        Block_viewForZoomingInScrollView blockk = (Block_viewForZoomingInScrollView)[scrollView performSelector:NSSelectorFromString(@"viewForZoomingInScrollViewBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewWillBeginZooming:(Block_scrollViewWillBeginZooming)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView, UIView *view) {
        Block_scrollViewWillBeginZooming blockk = (Block_scrollViewWillBeginZooming)[scrollView performSelector:NSSelectorFromString(@"scrollViewWillBeginZoomingBlock")];
        return blockk(scrollView, view);
    }];
}
- (void)block_scrollViewDidEndZooming:(Block_scrollViewDidEndZooming)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView, UIView *view, CGFloat scale) {
        Block_scrollViewDidEndZooming blockk = (Block_scrollViewDidEndZooming)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidEndZoomingBlock")];
        return blockk(scrollView, view, scale);
    }];
}
- (void)block_scrollViewShouldScrollToTop:(Block_scrollViewShouldScrollToTop)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UIScrollView *scrollView) {
        Block_scrollViewShouldScrollToTop blockk = (Block_scrollViewShouldScrollToTop)[scrollView performSelector:NSSelectorFromString(@"scrollViewShouldScrollToTopBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewDidScrollToTop:(Block_scrollViewDidScrollToTop)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewDidScrollToTop blockk = (Block_scrollViewDidScrollToTop)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidScrollToTopBlock")];
        return blockk(scrollView);
    }];
}
- (void)block_scrollViewDidChangeAdjustedContentInset:(Block_scrollViewDidChangeAdjustedContentInset)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UIScrollView *scrollView) {
        Block_scrollViewDidChangeAdjustedContentInset blockk = (Block_scrollViewDidChangeAdjustedContentInset)[scrollView performSelector:NSSelectorFromString(@"scrollViewDidChangeAdjustedContentInsetBlock")];
        return blockk(scrollView);
    }];
}
#pragma clang diagnostic pop
#pragma clang diagnostic pop

#pragma mark - ForwardingManager
- (void)setForwardingManager:(TableForwarding *)forwardingManager {
    objc_setAssociatedObject(self, @selector(forwardingManager), forwardingManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (TableForwarding *)forwardingManager {
    id _fdm = objc_getAssociatedObject(self, _cmd);
    if (!_fdm) {
        _fdm = [TableForwarding new];
        [self setForwardingManager:_fdm];
    }
    return _fdm;
}
@end
