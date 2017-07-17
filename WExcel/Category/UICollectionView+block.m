//
//  UICollectionView+block.m
//  MyExcel
//
//  Created by Wu on 2017/7/11.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "UICollectionView+block.h"
#import <objc/runtime.h>

/*
 不含self变量的block
 Block_numberOfItemsInSection   numberOfItemsInSectionBlock
 包含self变量的block  这个block是为了减少第一个变量(id self) 的承接所用的 block
 Block_numberOfItemsInSection_WithSelf  numberOfItemsInSectionBlock_withSelf
  
 流程:
 一. +load
 用runtime把layoutSubviews,drawRect,willMoveToWindow替换为其他方法以增加设置代理的用途
 利用runtime把所有的protocol内的方法转化为含block的Property
 二.  block_numberOfItemsInSection
 用户执行替代protocol的block方法
 在这个方法里把传过来的block赋值给上一步生成相应的含block的Property里.
 再把这个block的返回值传给另一个用于减少self变量的block里,并且执行后面这个含block的Property的set方法.
 三. 在执行layoutSubviews,drawRect,willMoveToWindow的替代方法时,会设置相应的代理,以启动respondsToSelector或forwardingTargetForSelector里面和protocol相关的代理方法.
 大部分@optional代理方法会先执行respondsToSelector来判断是否实现了某个代理方法,此时在respondsToSelector里面用和这个代理方法相关的Property的get方法来获取这个Property,如果这个Property已经被set(即已经实现了相关的block方法),则returen yes
 respondsToSelector 返回yes 或者不走respondsToSelector方法的代理方法 会直接走forwardingTargetForSelector的消息转发处理,此时在forwardingTargetForSelector里面同样判断是否能获取到含block的Property,如果可以,则把消息转发给self.forwardingManager,并且给self.forwardingManager 增加一个方法,这个方法的核心就是用前面的block实现的
 
 */

@interface CollectionForwarding : NSObject
@end
@implementation CollectionForwarding
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wprotocol"
@implementation UICollectionView (block)
#pragma clang diagnostic pop

#pragma mark - Block - WithSelf - UIcollectionViewDataSource
typedef NSInteger (^Block_numberOfItemsInSection_WithSelf)(id self, UICollectionView *collectionView, NSInteger section);
typedef UICollectionViewCell * (^Block_cellForItemAtIndexPath_WithSelf)(id self, UICollectionView *collectionView, NSIndexPath *indexPath);
typedef NSInteger (^Block_numberOfSectionsInCollectionView_WithSelf)(id self, UICollectionView *collectionView);
typedef UICollectionReusableView * (^Block_viewForSupplementaryElementOfKind_atIndexPath_WithSelf)(id self, UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath);
typedef BOOL (^Block_canMoveItemAtIndexPath_WithSelf)(id self, UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_moveItemAtIndexPath_toIndexPath_WithSelf)(id self, UICollectionView *collectionView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);
typedef NSArray<NSString *> * (^Block_indexTitlesForCollectionView_WithSelf)(id self, UICollectionView *collectionView);
typedef NSIndexPath * (^Block_indexPathForIndexTitle_atIndex_WithSelf)(id self, UICollectionView *collectionView, NSString *title, NSInteger index);

#pragma mark Block - WithSelf - UICollectionViewDataSourcePrefetching
typedef void (^Block_prefetchItemsAtIndexPaths_WithSelf)(UICollectionView *collectionView, NSArray <NSIndexPath *> *indexPaths);
typedef void (^Block_cancelPrefetchingForItemsAtIndexPaths_WithSelf)(UICollectionView *collectionView, NSArray <NSIndexPath *> *indexPaths);

#pragma mark Block - WithSelf - UICollectionViewDelegate
typedef BOOL (^Block_shouldHighlightItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didHighlightItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didUnhighlightItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldSelectItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldDeselectItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didSelectItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didDeselectItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_willDisplayCell_forItemAtIndexPath_WithSelf)(UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath);
typedef void (^Block_willDisplaySupplementaryView_forElementKind_atIndexPath_WithSelf)(UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath);
typedef void (^Block_didEndDisplayingCell_forItemAtIndexPath_WithSelf)(UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath);
typedef void (^Block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath_WithSelf)(UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldShowMenuForItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_canPerformAction_forItemAtIndexPath_withSender_WithSelf)(UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender);
typedef void (^Block_performAction_forItemAtIndexPath_withSender_WithSelf)(UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender);
typedef UICollectionViewTransitionLayout * (^Block_transitionLayoutForOldLayout_newLayout_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *fromLayout, UICollectionViewLayout *toLayout);
typedef BOOL (^Block_canFocusItemAtIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldUpdateFocusInContext_WithSelf)(UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context);
typedef void (^Block_didUpdateFocusInContext_withAnimationCoordinator__WithSelf)(UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator);
typedef NSIndexPath * (^Block_indexPathForPreferredFocusedViewInCollectionView_WithSelf)(UICollectionView *collectionView);
typedef NSIndexPath * (^Block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath_WithSelf)(UICollectionView *collectionView, NSIndexPath *originalIndexPath, NSIndexPath *proposedIndexPath);
typedef CGPoint (^Block_targetContentOffsetForProposedContentOffset_WithSelf)(UICollectionView *collectionView, CGPoint proposedContentOffset);

#pragma mark Block - WithSelf - UICollectionViewDelegateFlowLayout
typedef CGSize (^Block_layout_sizeForItemAtIndexPath_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath);
typedef UIEdgeInsets (^Block_layout_insetForSectionAtIndex_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGFloat (^Block_layout_minimumLineSpacingForSectionAtIndex_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGFloat (^Block_layout_minimumInteritemSpacingForSectionAtIndex_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section_WithSelf);
typedef CGSize (^Block_layout_referenceSizeForHeaderInSection_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGSize (^Block_layout_referenceSizeForFooterInSection_WithSelf)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);

#pragma mark Block - WithSelf - UICollectionViewDragDelegate
typedef NSArray<UIDragItem *> * (^Block_itemsForBeginningDragSession_atIndexPath_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *indexPath);
typedef NSArray<UIDragItem *> * (^Block_itemsForAddingToDragSession_atIndexPath_point_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *indexPath , CGPoint point);
typedef UIDragPreviewParameters * (^Block_dragPreviewParametersForItemAtIndexPath_WithSelf_)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_dragSessionWillBegin_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);
typedef void (^Block_dragSessionDidEnd_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);
typedef BOOL (^Block_dragSessionAllowsMoveOperation_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);
typedef BOOL (^Block_dragSessionIsRestrictedToDraggingApplication_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);

#pragma mark Block - WithSelf - UICollectionViewDropDelegate
typedef void (^Block_performDropWithCoordinator_WithSelf_)(UICollectionView *collectionView, id<UICollectionViewDropCoordinator> coordinator);
typedef BOOL (^Block_canHandleDropSession_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);
typedef void (^Block_dropSessionDidEnter_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);
typedef UICollectionViewDropProposal * (^Block_dropSessionDidUpdate_withDestinationIndexPath_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *destinationIndexPath);
typedef void (^Block_dropSessionDidExit_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);
typedef void (^Block_dropSessionDidEnd_WithSelf_)(UICollectionView *collectionView, id<UIDragSession> session);

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
    
    //动态增加所有protocol的方法转化后的Property及用于减少self变量的另一个block的Property
    [self addPropertyFromProtocol:@protocol(UICollectionViewDataSource)];
    [self addPropertyFromProtocol:@protocol(UICollectionViewDelegateFlowLayout)];
    [self addPropertyFromProtocol:@protocol(UICollectionViewDelegate)];
    [self addPropertyFromProtocol:@protocol(UICollectionViewDataSourcePrefetching)];
    [self addPropertyFromProtocol:@protocol(UICollectionViewDragDelegate)];
    [self addPropertyFromProtocol:@protocol(UICollectionViewDropDelegate)];
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

//自动添加property 传入一个变量名如:  numberOfItemsInSectionBlock
+ (void)addBlockProperty:(NSString *)name {
    
    NSString *key = [NSString stringWithFormat:@"%p_%@",self,name];
    
    //set
    id setBlock = ^(id self, id sender){
        objc_setAssociatedObject(self, (__bridge void*)key, sender, OBJC_ASSOCIATION_COPY_NONATOMIC);
    };
    class_addMethod([UICollectionView class], NSSelectorFromString([self getSetNameFromPropertyName:name]), imp_implementationWithBlock(setBlock), "v@?");
    
    //get
    id getBlock = ^id(id self){
        return objc_getAssociatedObject(self, (__bridge void*)key);
    };
    class_addMethod([UICollectionView class], NSSelectorFromString(name), imp_implementationWithBlock(getBlock), "?@");
}

//把protocol里面的方法名转化为变量方法 例如:collection:numberOfItemsInSection: -> numberOfItemsInSectionBlock
+ (NSString *)getPropertyNameFromProtocolSelectorName:(NSString *)selecstorName {
    NSMutableString *aSelectorString = [NSMutableString stringWithString:selecstorName];
    if (![aSelectorString containsString:@"_"]) {
        if ([aSelectorString containsString:@"ollectionView"] || [aSelectorString containsString:@"crollView"]) {
            if ([aSelectorString containsString:@"collectionView:"]) {
                [aSelectorString deleteCharactersInRange:[aSelectorString rangeOfString:@"collectionView:"]];
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

//把Property名字改为set方法的名字 例如numberOfItemsInSectionBlock -> setNumberOfItemsInSectionBlock
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

- (void)swizzlingWillMoveToWindow:(UIWindow *)newWindow {
    if (newWindow && [self isKindOfClass:[UICollectionView class]]) {
        
        if ([self isKindOfClass:[UICollectionView class]]) {
            [self setDelegates];
            [self swizzlingWillMoveToWindow:newWindow];
        }
    }
}

- (void)swizzlingLayoutSubviews {
    [self setDelegates];
    [self swizzlingLayoutSubviews];
}

- (void)swizzlingDrawRect:(CGRect)rect {
    [self setDelegates];
    [self swizzlingDrawRect:rect];
}

- (void)setDelegates {
    
    self.delegate = self.delegate ?: self;
    self.dataSource = self.dataSource ?: self;
    
    if (@available(iOS 10.0, *)) {
        self.prefetchDataSource = self.prefetchDataSource ?: self;
    }
    
    if (@available(iOS 11.0, *)) {
        self.dragDelegate = self.dragDelegate ?: self;
        self.dropDelegate = self.dropDelegate ?: self;
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    //这一段用来替代判断self.numberOfItemsInSectionBlock是否被实现
    NSString *aSelectorString = [[self class] getPropertyNameFromProtocolSelectorName:NSStringFromSelector(aSelector)];
    if (aSelectorString) {
        //此处使用 instancesRespondToSelector 来先判断是否可以执行此方法,如果用 canPerform 会再次执行respondsToSelector 会导致死循环
        if ([UICollectionView instancesRespondToSelector:NSSelectorFromString(aSelectorString)] &&
            [self performSelector:NSSelectorFromString(aSelectorString)]) {
            
            aSelectorString = [aSelectorString stringByAppendingString:@"_withSelf"];
            id propertyBlockWithSelf = [self performSelector:NSSelectorFromString(aSelectorString)];
            const char *typeEncoding = method_getTypeEncoding(class_getInstanceMethod([self class], aSelector));
            class_addMethod([CollectionForwarding class], aSelector, imp_implementationWithBlock(propertyBlockWithSelf), typeEncoding);
            return self.forwardingManager;
            
        } else {
            return [super forwardingTargetForSelector:aSelector];
        }
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    
    if (![self isKindOfClass:[UICollectionView class]]) {
        return [super respondsToSelector:aSelector];
    }
    
    if (self.delegate || self.dataSource) {
        
        NSString *aSelectorString = [[self class] getPropertyNameFromProtocolSelectorName:NSStringFromSelector(aSelector)];
        if (aSelectorString) {
            
            //相当于执行get方法 [self performSelector:NSSelectorFromString(aSelectorString)]
            //此处使用 instancesRespondToSelector 来先判断是否可以执行此方法,如果用 canPerform 会再次执行respondsToSelector 会导致死循环
            if ([UICollectionView instancesRespondToSelector:NSSelectorFromString(aSelectorString)] &&
                [self performSelector:NSSelectorFromString(aSelectorString)]) {
                return 1;
            }
        }
    }
    return [super respondsToSelector:aSelector];
}

#pragma mark - InterfaceMethod - UICollectionViewDataSource -

//转换方法名为变量名 再返回含self变量的block的set方法名
//block_numberOfItemsInSection->setNumberOfItemsInSectionBlock
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

- (void)block_numberOfItemsInSection:(Block_numberOfItemsInSection)block {
    //执行不含self变量的block的set方法,且返回含self变量的block的set方法名
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    //执行含self变量的block的set方法
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSInteger(id self, UICollectionView *collectionView, NSInteger section) {
        Block_numberOfItemsInSection blockk = (Block_numberOfItemsInSection)[collectionView performSelector:NSSelectorFromString(@"numberOfItemsInSectionBlock")];
        return blockk(collectionView, section);
    }];
}
- (void)block_cellForItemAtIndexPath:(Block_cellForItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UICollectionViewCell *(id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_cellForItemAtIndexPath blockk = (Block_cellForItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"cellForItemAtIndexPathBlock")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_numberOfSectionsInCollectionView:(Block_numberOfSectionsInCollectionView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSInteger (id self, UICollectionView *collectionView) {
        Block_numberOfSectionsInCollectionView blockk = (Block_numberOfSectionsInCollectionView)[collectionView performSelector:NSSelectorFromString(@"numberOfSectionsInCollectionViewBlock")];
        return blockk(collectionView);
    }];
}
- (void)block_viewForSupplementaryElementOfKind_atIndexPath:(Block_viewForSupplementaryElementOfKind_atIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UICollectionReusableView *(id self, UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath) {
        Block_viewForSupplementaryElementOfKind_atIndexPath blockk = (Block_viewForSupplementaryElementOfKind_atIndexPath)[collectionView performSelector:NSSelectorFromString(@"viewForSupplementaryElementOfKind_atIndexPathBlock")];
        return blockk(collectionView, kind, indexPath);
    }];
}
- (void)block_canMoveItemAtIndexPath:(Block_canMoveItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_canMoveItemAtIndexPath blockk = (Block_canMoveItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"canMoveItemAtIndexPathBlock")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_moveItemAtIndexPath_toIndexPath:(Block_moveItemAtIndexPath_toIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath) {
        Block_moveItemAtIndexPath_toIndexPath blockk = (Block_moveItemAtIndexPath_toIndexPath)[collectionView performSelector:NSSelectorFromString(@"moveItemAtIndexPath_toIndexPathBlock")];
        blockk(collectionView, sourceIndexPath, destinationIndexPath);
    }];
}
- (void)block_indexTitlesForCollectionView:(Block_indexTitlesForCollectionView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<NSString *> *(id self, UICollectionView *collectionView) {
        Block_indexTitlesForCollectionView blockk = (Block_indexTitlesForCollectionView)[collectionView performSelector:NSSelectorFromString(@"indexTitlesForCollectionViewBlock")];
        return blockk(collectionView);
    }];
}
- (void)block_indexPathForIndexTitle_atIndex:(Block_indexPathForIndexTitle_atIndex)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath *(id self, UICollectionView *collectionView, NSString *title, NSInteger index) {
        Block_indexPathForIndexTitle_atIndex blockk = (Block_indexPathForIndexTitle_atIndex)[collectionView performSelector:NSSelectorFromString(@"indexPathForIndexTitle_atIndexBlock")];
        return blockk(collectionView, title, index);
    }];
}

#pragma mark InterfaceMethod - UICollectionViewDataSourcePrefetching

- (void)block_prefetchItemsAtIndexPaths:(Block_prefetchItemsAtIndexPaths)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSArray <NSIndexPath *> *indexPaths) {
        Block_prefetchItemsAtIndexPaths blockk = (Block_prefetchItemsAtIndexPaths)[collectionView performSelector:NSSelectorFromString(@"prefetchItemsAtIndexPathsBlock")];
        blockk(collectionView, indexPaths);
    }];
}
- (void)block_cancelPrefetchingForItemsAtIndexPaths:(Block_cancelPrefetchingForItemsAtIndexPaths)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSArray <NSIndexPath *> *indexPaths) {
        Block_cancelPrefetchingForItemsAtIndexPaths blockk = (Block_cancelPrefetchingForItemsAtIndexPaths)[collectionView performSelector:NSSelectorFromString(@"cancelPrefetchingForItemsAtIndexPathsBlock")];
        blockk(collectionView, indexPaths);
    }];
}

#pragma mark InterfaceMethod - UICollectionViewDelegate

- (void)block_shouldHighlightItemAtIndexPath:(Block_shouldHighlightItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_shouldHighlightItemAtIndexPath blockk = (Block_shouldHighlightItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"shouldHighlightItemAtIndexPathBlock")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_didHighlightItemAtIndexPath:(Block_didHighlightItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_didHighlightItemAtIndexPath blockk = (Block_didHighlightItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"didHighlightItemAtIndexPathBlock")];
        blockk(collectionView, indexPath);
    }];
}
- (void)block_didUnhighlightItemAtIndexPath:(Block_didUnhighlightItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_didUnhighlightItemAtIndexPath blockk = (Block_didUnhighlightItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"didUnhighlightItemAtIndexPathBlock")];
        blockk(collectionView, indexPath);
    }];
}
- (void)block_shouldSelectItemAtIndexPath:(Block_shouldSelectItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_shouldSelectItemAtIndexPath blockk = (Block_shouldSelectItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"shouldSelectItemAtIndexPathBlock")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_shouldDeselectItemAtIndexPath:(Block_shouldDeselectItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_shouldDeselectItemAtIndexPath blockk = (Block_shouldDeselectItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"shouldDeselectItemAtIndexPathBlock")];
        blockk(collectionView, indexPath);
    }];
}
- (void)block_didSelectItemAtIndexPath:(Block_didSelectItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_didSelectItemAtIndexPath blockk = (Block_didSelectItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"didSelectItemAtIndexPathBlock")];
        blockk(collectionView, indexPath);
    }];
}
- (void)block_didDeselectItemAtIndexPath:(Block_didDeselectItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_didDeselectItemAtIndexPath blockk = (Block_didDeselectItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"didDeselectItemAtIndexPathBlock")];
        blockk(collectionView, indexPath);
    }];
}
- (void)block_willDisplayCell_forItemAtIndexPath:(Block_willDisplayCell_forItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath) {
        Block_willDisplayCell_forItemAtIndexPath blockk = (Block_willDisplayCell_forItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"willDisplayCell_forItemAtIndexPathBlock")];
        blockk(collectionView, cell, indexPath);
    }];
}
- (void)block_willDisplaySupplementaryView_forElementKind_atIndexPath:(Block_willDisplaySupplementaryView_forElementKind_atIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath) {
        Block_willDisplaySupplementaryView_forElementKind_atIndexPath blockk = (Block_willDisplaySupplementaryView_forElementKind_atIndexPath)[collectionView performSelector:NSSelectorFromString(@"willDisplaySupplementaryView_forElementKind_atIndexPathBlock")];
        blockk(collectionView, view, elementKind, indexPath);
    }];
}
- (void)block_didEndDisplayingCell_forItemAtIndexPath:(Block_didEndDisplayingCell_forItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath) {
        Block_didEndDisplayingCell_forItemAtIndexPath blockk = (Block_didEndDisplayingCell_forItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"didEndDisplayingCell_forItemAtIndexPathBlock")];
        blockk(collectionView, cell, indexPath);
    }];
}
- (void)block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath:(Block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath) {
        Block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath blockk = (Block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath)[collectionView performSelector:NSSelectorFromString(@"didEndDisplayingSupplementaryView_forElementOfKind_atIndexPathBlock")];
        blockk(collectionView, view, elementKind, indexPath);
    }];
}
- (void)block_shouldShowMenuForItemAtIndexPath:(Block_shouldShowMenuForItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_shouldShowMenuForItemAtIndexPath blockk = (Block_shouldShowMenuForItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"shouldShowMenuForItemAtIndexPathBlock")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_canPerformAction_forItemAtIndexPath_withSender:(Block_canPerformAction_forItemAtIndexPath_withSender)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender) {
        Block_canPerformAction_forItemAtIndexPath_withSender blockk = (Block_canPerformAction_forItemAtIndexPath_withSender)[collectionView performSelector:NSSelectorFromString(@"canPerformAction_forItemAtIndexPath_withSenderBlock")];
        return blockk(collectionView, action, indexPath, sender);
    }];
}
- (void)block_performAction_forItemAtIndexPath_withSender:(Block_performAction_forItemAtIndexPath_withSender)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender) {
        Block_performAction_forItemAtIndexPath_withSender blockk = (Block_performAction_forItemAtIndexPath_withSender)[collectionView performSelector:NSSelectorFromString(@"performAction_forItemAtIndexPath_withSenderBlock")];
        blockk(collectionView, action, indexPath, sender);
    }];
}
- (void)block_transitionLayoutForOldLayout_newLayout:(Block_transitionLayoutForOldLayout_newLayout)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UICollectionViewTransitionLayout * (id self, UICollectionView *collectionView, UICollectionViewLayout *fromLayout, UICollectionViewLayout *toLayout) {
        Block_transitionLayoutForOldLayout_newLayout blockk = (Block_transitionLayoutForOldLayout_newLayout)[collectionView performSelector:NSSelectorFromString(@"transitionLayoutForOldLayout_newLayoutBlock")];
        return blockk(collectionView, fromLayout, toLayout);
    }];
}
- (void)block_canFocusItemAtIndexPath:(Block_canFocusItemAtIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_canFocusItemAtIndexPath blockk = (Block_canFocusItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"canFocusItemAtIndexPathBlock")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_shouldUpdateFocusInContext:(Block_shouldUpdateFocusInContext_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context) {
        Block_shouldUpdateFocusInContext_ blockk = (Block_shouldUpdateFocusInContext_)[collectionView performSelector:NSSelectorFromString(@"shouldUpdateFocusInContextBlock")];
        return blockk(collectionView, context);
    }];
}
- (void)block_didUpdateFocusInContext_withAnimationCoordinator:(Block_didUpdateFocusInContext_withAnimationCoordinator_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator) {
        Block_didUpdateFocusInContext_withAnimationCoordinator_ blockk = (Block_didUpdateFocusInContext_withAnimationCoordinator_)[collectionView performSelector:NSSelectorFromString(@"didUpdateFocusInContext_withAnimationCoordinator_Block")];
        blockk(collectionView, context, coordinator);
    }];
}
- (void)block_indexPathForPreferredFocusedViewInCollectionView:(Block_indexPathForPreferredFocusedViewInCollectionView)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath * (id self, UICollectionView *collectionView) {
        Block_indexPathForPreferredFocusedViewInCollectionView blockk = (Block_indexPathForPreferredFocusedViewInCollectionView)[collectionView performSelector:NSSelectorFromString(@"indexPathForPreferredFocusedViewInCollectionViewBlock")];
        return blockk(collectionView);
    }];
}
- (void)block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath:(Block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSIndexPath * (id self, UICollectionView *collectionView, NSIndexPath *originalIndexPath, NSIndexPath *proposedIndexPath) {
        Block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath blockk = (Block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath)[collectionView performSelector:NSSelectorFromString(@"targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPathBlock")];
        return blockk(collectionView, originalIndexPath, proposedIndexPath);
    }];
}
- (void)block_targetContentOffsetForProposedContentOffset:(Block_targetContentOffsetForProposedContentOffset)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGPoint (id self, UICollectionView *collectionView, CGPoint proposedContentOffset) {
        Block_targetContentOffsetForProposedContentOffset blockk = (Block_targetContentOffsetForProposedContentOffset)[collectionView performSelector:NSSelectorFromString(@"targetContentOffsetForProposedContentOffsetBlock")];
        return blockk(collectionView, proposedContentOffset);
    }];
}

#pragma mark InterfaceMethod - UICollectionViewDelegateFlowLayout

- (void)block_layout_sizeForItemAtIndexPath:(Block_layout_sizeForItemAtIndexPath)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGSize (id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath) {
        Block_layout_sizeForItemAtIndexPath blockk = (Block_layout_sizeForItemAtIndexPath)[collectionView performSelector:NSSelectorFromString(@"layout_sizeForItemAtIndexPathBlock")];
        return blockk(collectionView, collectionViewLayout, indexPath);
    }];
}
- (void)block_layout_insetForSectionAtIndex:(Block_layout_insetForSectionAtIndex)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UIEdgeInsets (id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        Block_layout_insetForSectionAtIndex blockk = (Block_layout_insetForSectionAtIndex)[collectionView performSelector:NSSelectorFromString(@"layout_insetForSectionAtIndexBlock")];
        return blockk(collectionView, collectionViewLayout, section);
    }];
}
- (void)block_layout_minimumLineSpacingForSectionAtIndex:(Block_layout_minimumLineSpacingForSectionAtIndex)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        Block_layout_minimumLineSpacingForSectionAtIndex blockk = (Block_layout_minimumLineSpacingForSectionAtIndex)[collectionView performSelector:NSSelectorFromString(@"layout_minimumLineSpacingForSectionAtIndexBlock")];
        return blockk(collectionView, collectionViewLayout, section);
    }];
}
- (void)block_layout_minimumInteritemSpacingForSectionAtIndex:(Block_layout_minimumInteritemSpacingForSectionAtIndex)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGFloat (id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        Block_layout_minimumInteritemSpacingForSectionAtIndex blockk = (Block_layout_minimumInteritemSpacingForSectionAtIndex)[collectionView performSelector:NSSelectorFromString(@"layout_minimumInteritemSpacingForSectionAtIndexBlock")];
        return blockk(collectionView, collectionViewLayout, section);
    }];
}
- (void)block_layout_referenceSizeForHeaderInSection:(Block_layout_referenceSizeForHeaderInSection)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGSize (id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        Block_layout_referenceSizeForHeaderInSection blockk = (Block_layout_referenceSizeForHeaderInSection)[collectionView performSelector:NSSelectorFromString(@"layout_referenceSizeForHeaderInSectionBlock")];
        return blockk(collectionView, collectionViewLayout, section);
    }];
}
- (void)block_layout_referenceSizeForFooterInSection:(Block_layout_referenceSizeForFooterInSection)block{
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^CGSize (id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        Block_layout_referenceSizeForFooterInSection blockk = (Block_layout_referenceSizeForFooterInSection)[collectionView performSelector:NSSelectorFromString(@"layout_referenceSizeForFooterInSectionBlock")];
        return blockk(collectionView, collectionViewLayout, section);
    }];
}

#pragma mark InterfaceMethod - UICollectionViewDragDelegate

- (void)block_itemsForBeginningDragSession_atIndexPath:(Block_itemsForBeginningDragSession_atIndexPath_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<UIDragItem *> * (id self, UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *indexPath) {
        Block_itemsForBeginningDragSession_atIndexPath_ blockk = (Block_itemsForBeginningDragSession_atIndexPath_)[collectionView performSelector:NSSelectorFromString(@"itemsForBeginningDragSession_atIndexPath_Block")];
        return blockk(collectionView, session, indexPath);
    }];
}
- (void)block_itemsForAddingToDragSession_atIndexPath_point:(Block_itemsForAddingToDragSession_atIndexPath_point_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^NSArray<UIDragItem *> * (id self, UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *indexPath , CGPoint point) {
        Block_itemsForAddingToDragSession_atIndexPath_point_ blockk = (Block_itemsForAddingToDragSession_atIndexPath_point_)[collectionView performSelector:NSSelectorFromString(@"itemsForAddingToDragSession_atIndexPath_point_Block")];
        return blockk(collectionView, session, indexPath, point);
    }];
}
- (void)block_dragPreviewParametersForItemAtIndexPath:(Block_dragPreviewParametersForItemAtIndexPath_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UIDragPreviewParameters * (id self, UICollectionView *collectionView, NSIndexPath *indexPath) {
        Block_dragPreviewParametersForItemAtIndexPath_ blockk = (Block_dragPreviewParametersForItemAtIndexPath_)[collectionView performSelector:NSSelectorFromString(@"dragPreviewParametersForItemAtIndexPath_Block")];
        return blockk(collectionView, indexPath);
    }];
}
- (void)block_dragSessionWillBegin:(Block_dragSessionWillBegin_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dragSessionWillBegin_ blockk = (Block_dragSessionWillBegin_)[collectionView performSelector:NSSelectorFromString(@"dragSessionWillBegin_Block")];
        blockk(collectionView, session);
    }];
}
- (void)block_dragSessionDidEnd:(Block_dragSessionDidEnd_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dragSessionDidEnd_ blockk = (Block_dragSessionDidEnd_)[collectionView performSelector:NSSelectorFromString(@"dragSessionDidEnd_Block")];
        blockk(collectionView, session);
    }];
}
- (void)block_dragSessionAllowsMoveOperation:(Block_dragSessionAllowsMoveOperation_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dragSessionAllowsMoveOperation_ blockk = (Block_dragSessionAllowsMoveOperation_)[collectionView performSelector:NSSelectorFromString(@"dragSessionAllowsMoveOperation_Block")];
        return blockk(collectionView, session);
    }];
}
- (void)block_dragSessionIsRestrictedToDraggingApplication:(Block_dragSessionIsRestrictedToDraggingApplication_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dragSessionIsRestrictedToDraggingApplication_ blockk = (Block_dragSessionIsRestrictedToDraggingApplication_)[collectionView performSelector:NSSelectorFromString(@"dragSessionIsRestrictedToDraggingApplication_Block")];
        return blockk(collectionView, session);
    }];
}

#pragma mark InterfaceMethod - UICollectionViewDropDelegate

- (void)block_performDropWithCoordinator:(Block_performDropWithCoordinator_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, id<UICollectionViewDropCoordinator> coordinator) {
        Block_performDropWithCoordinator_ blockk = (Block_performDropWithCoordinator_)[collectionView performSelector:NSSelectorFromString(@"performDropWithCoordinator_Block")];
        blockk(collectionView, coordinator);
    }];
}
- (void)block_canHandleDropSession:(Block_canHandleDropSession_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^BOOL (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_canHandleDropSession_ blockk = (Block_canHandleDropSession_)[collectionView performSelector:NSSelectorFromString(@"canHandleDropSession_Block")];
        return blockk(collectionView, session);
    }];
}
- (void)block_dropSessionDidEnter:(Block_dropSessionDidEnter_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dropSessionDidEnter_ blockk = (Block_dropSessionDidEnter_)[collectionView performSelector:NSSelectorFromString(@"dropSessionDidEnter_Block")];
        blockk(collectionView, session);
    }];
}
- (void)block_dropSessionDidUpdate_withDestinationIndexPath:(Block_dropSessionDidUpdate_withDestinationIndexPath_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^UICollectionViewDropProposal * (id self, UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *destinationIndexPath) {
        Block_dropSessionDidUpdate_withDestinationIndexPath_ blockk = (Block_dropSessionDidUpdate_withDestinationIndexPath_)[collectionView performSelector:NSSelectorFromString(@"dropSessionDidUpdate_withDestinationIndexPath_Block")];
        return blockk(collectionView, session, destinationIndexPath);
    }];
}
- (void)block_dropSessionDidExit:(Block_dropSessionDidExit_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dropSessionDidExit_ blockk = (Block_dropSessionDidExit_)[collectionView performSelector:NSSelectorFromString(@"dropSessionDidExit_Block")];
        blockk(collectionView, session);
    }];
}
- (void)block_dropSessionDidEnd:(Block_dropSessionDidEnd_)block {
    NSString *settingMethodOfWithSelfBlockString = [self getSetNameFromBlockSel:_cmd andSetProperty:block];
    [self performSelector:NSSelectorFromString(settingMethodOfWithSelfBlockString) withObject:^void (id self, UICollectionView *collectionView, id<UIDragSession> session) {
        Block_dropSessionDidEnd_ blockk = (Block_dropSessionDidEnd_)[collectionView performSelector:NSSelectorFromString(@"dropSessionDidEnd_Block")];
        blockk(collectionView, session);
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
- (void)setForwardingManager:(CollectionForwarding *)forwardingManager {
    objc_setAssociatedObject(self, @selector(forwardingManager), forwardingManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CollectionForwarding *)forwardingManager {
    id _fdm = objc_getAssociatedObject(self, _cmd);
    if (!_fdm) {
        _fdm = [CollectionForwarding new];
        [self setForwardingManager:_fdm];
    }
    return _fdm;
}
@end
