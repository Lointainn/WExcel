//
//  UITableView+block.h
//  MyExcel
//
//  Created by Tusky on 2017/7/3.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - @Interface
@interface UITableView (block) <UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UITableViewDragDelegate, UITableViewDropDelegate>

#pragma mark - Block - UITableViewDataSource
typedef UITableViewCell * (^Block_cellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSInteger (^Block_numberOfRowsInSection)(UITableView *tableView, NSInteger section);
typedef NSInteger (^Block_numberOfSectionsInTableView)(UITableView *tableView);
typedef NSString * (^Block_titleForHeaderInSection)(UITableView *tableView, NSInteger section);
typedef NSString * (^Block_titleForFooterInSection)(UITableView *tableView, NSInteger section);
typedef BOOL (^Block_canEditRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_canMoveRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSArray<NSString *> * (^Block_sectionIndexTitlesForTableView)(UITableView *tableView);
typedef NSInteger (^Block_sectionForSectionIndexTitle)(UITableView *tableView, NSString *title, NSInteger index);
typedef void (^Block_commitEditingStyle)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);
typedef void (^Block_moveRowAtIndexPath)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);

#pragma mark Block - UITableViewDataSourcePrefetching
typedef void (^Block_prefetchRowsAtIndexPaths)(UITableView *tableView, NSArray<NSIndexPath *> *indexPaths);
typedef void (^Block_cancelPrefetchingForRowsAtIndexPaths)(UITableView *tableView, NSArray<NSIndexPath *> *indexPaths);

#pragma mark Block - UITableViewDelegate
typedef void (^Block_willDisplayCell)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^Block_willDisplayHeaderView)(UITableView *tableView, UIView *view, NSInteger section) NS_AVAILABLE_IOS(6_0);
typedef void (^Block_willDisplayFooterView)(UITableView *tableView, UIView *view, NSInteger section) NS_AVAILABLE_IOS(6_0);
typedef void (^Block_didEndDisplayingCell)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath) NS_AVAILABLE_IOS(6_0);
typedef void (^Block_didEndDisplayingHeaderView)(UITableView *tableView, UIView *view, NSInteger section) NS_AVAILABLE_IOS(6_0);
typedef void (^Block_didEndDisplayingFooterView)(UITableView *tableView, UIView *view, NSInteger section) NS_AVAILABLE_IOS(6_0);
typedef CGFloat (^Block_heightForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^Block_heightForHeaderInSection)(UITableView *tableView, NSInteger section);
typedef CGFloat (^Block_heightForFooterInSection)(UITableView *tableView, NSInteger section);
typedef CGFloat (^Block_estimatedHeightForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(7_0);
typedef CGFloat (^Block_estimatedHeightForHeaderInSection)(UITableView *tableView, NSInteger section) NS_AVAILABLE_IOS(7_0);
typedef CGFloat (^Block_estimatedHeightForFooterInSection)(UITableView *tableView, NSInteger section) NS_AVAILABLE_IOS(7_0);
typedef UIView * (^Block_viewForHeaderInSection)(UITableView *tableView, NSInteger section);
typedef UIView * (^Block_viewForFooterInSection)(UITableView *tableView, NSInteger section);
typedef void (^Block_accessoryButtonTappedForRowWithIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldHighlightRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(6_0);
typedef void (^Block_didHighlightRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(6_0);
typedef void (^Block_didUnhighlightRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(6_0);
typedef NSIndexPath * (^Block_willSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSIndexPath * (^Block_willDeselectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(3_0);
typedef void (^Block_didSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didDeselectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(3_0);
typedef UITableViewCellEditingStyle (^Block_editingStyleForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSString * (^Block_titleForDeleteConfirmationButtonForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath)  NS_AVAILABLE_IOS(3_0);
typedef NSArray<UITableViewRowAction *> * (^Block_editActionsForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(8_0);
typedef BOOL (^Block_shouldIndentWhileEditingRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_willBeginEditingRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^Block_didEndEditingRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSIndexPath * (^Block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath);
typedef NSInteger (^Block_indentationLevelForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldShowMenuForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(5_0);
typedef BOOL (^Block_canPerformAction_forRowAtIndexPath_withSender)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender) NS_AVAILABLE_IOS(5_0);
typedef void (^Block_performAction_forRowAtIndexPath_withSender)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender) NS_AVAILABLE_IOS(5_0);
typedef BOOL (^Block_canFocusRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(9_0);
typedef BOOL (^Block_shouldUpdateFocusInContext)(UITableView *tableView, UITableViewFocusUpdateContext *context) NS_AVAILABLE_IOS(9_0);
typedef void (^Block_didUpdateFocusInContext_withAnimationCoordinator)(UITableView *tableView, UITableViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator) NS_AVAILABLE_IOS(9_0);
typedef NSIndexPath * (^Block_indexPathForPreferredFocusedViewInTableView)(UITableView *tableView) NS_AVAILABLE_IOS(9_0);

#pragma mark Block - UITableViewDragDelegate
typedef NSArray<UIDragItem *> * (^Block_itemsForBeginningDragSession_atIndexPath)(UITableView *tableView, id<UIDragSession> session, NSIndexPath *indexPath) API_AVAILABLE(ios(11.0));
typedef NSArray<UIDragItem *> * (^Block_itemsForAddingToDragSession_atIndexPath_point)(UITableView *tableView, id<UIDragSession> session, NSIndexPath *indexPath , CGPoint point) API_AVAILABLE(ios(11.0));
typedef UIDragPreviewParameters * (^Block_dragPreviewParametersForItemAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath) API_AVAILABLE(ios(11.0));
typedef void (^Block_dragSessionWillBegin)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef void (^Block_dragSessionDidEnd)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef BOOL (^Block_dragSessionAllowsMoveOperation)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef BOOL (^Block_dragSessionIsRestrictedToDraggingApplication)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));

#pragma mark Block - UITableViewDropDelegate
typedef void (^Block_performDropWithCoordinator)(UITableView *tableView, id<UITableViewDropCoordinator> coordinator) API_AVAILABLE(ios(11.0));
typedef BOOL (^Block_canHandleDropSession)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef void (^Block_dropSessionDidEnter)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef UITableViewDropProposal * (^Block_dropSessionDidUpdate_withDestinationIndexPath)(UITableView *tableView, id<UIDragSession> session, NSIndexPath *destinationIndexPath) API_AVAILABLE(ios(11.0));
typedef void (^Block_dropSessionDidExit)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef void (^Block_dropSessionDidEnd)(UITableView *tableView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));

#pragma mark Block - UIScrollViewDelegate
typedef void(^Block_scrollViewDidScroll)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidZoom)(UIScrollView *scrollView) NS_AVAILABLE_IOS(3_2);
typedef void(^Block_scrollViewWillBeginDragging)(UIScrollView *scrollView);
typedef void(^Block_scrollViewWillEndDragging_withVelocity_targetContentOffset)(UIScrollView *scrollView, CGPoint velocity, CGPoint *targetContentOffset) NS_AVAILABLE_IOS(5_0);
typedef void(^Block_scrollViewDidEndDragging)(UIScrollView *scrollView, BOOL decelerate);
typedef void(^Block_scrollViewWillBeginDecelerating)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidEndDecelerating)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidEndScrollingAnimation)(UIScrollView *scrollView);
typedef UIView *(^Block_viewForZoomingInScrollView)(UIScrollView *scrollView);
typedef void(^Block_scrollViewWillBeginZooming)(UIScrollView *scrollView, UIView *view) NS_AVAILABLE_IOS(3_2);
typedef void(^Block_scrollViewDidEndZooming)(UIScrollView *scrollView, UIView *view, CGFloat scale);
typedef BOOL(^Block_scrollViewShouldScrollToTop)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidScrollToTop)(UIScrollView *scrollView);
typedef void(^Block_scrollViewDidChangeAdjustedContentInset)(UIScrollView *scrollView) API_AVAILABLE(ios(11.0), tvos(11.0));

#pragma mark - InterfaceMethod - UITableViewDataSource
- (void)block_cellForRowAtIndexPath:(Block_cellForRowAtIndexPath)block;
- (void)block_numberOfRowsInSection:(Block_numberOfRowsInSection)block;
- (void)block_numberOfSectionsInTableView:(Block_numberOfSectionsInTableView)block;
- (void)block_titleForHeaderInSection:(Block_titleForHeaderInSection)block;
- (void)block_titleForFooterInSection:(Block_titleForFooterInSection)block;
- (void)block_canEditRowAtIndexPath:(Block_canEditRowAtIndexPath)block;
- (void)block_canMoveRowAtIndexPath:(Block_canMoveRowAtIndexPath)block;
- (void)block_sectionIndexTitlesForTableView:(Block_sectionIndexTitlesForTableView)block;
- (void)block_sectionForSectionIndexTitle:(Block_sectionForSectionIndexTitle)block;
- (void)block_commitEditingStyle:(Block_commitEditingStyle)block;
- (void)block_moveRowAtIndexPath:(Block_moveRowAtIndexPath)block;

#pragma mark InterfaceMethod - UITableViewDataSourcePrefetching
- (void)block_prefetchRowsAtIndexPaths:(Block_prefetchRowsAtIndexPaths)block;
- (void)block_cancelPrefetchingForRowsAtIndexPaths:(Block_cancelPrefetchingForRowsAtIndexPaths)block;

#pragma mark InterfaceMethod - UITableViewDelegate
- (void)block_willDisplayCell:(Block_willDisplayCell)block;
- (void)block_willDisplayHeaderView:(Block_willDisplayHeaderView)block NS_AVAILABLE_IOS(6_0);
- (void)block_willDisplayFooterView:(Block_willDisplayFooterView)block NS_AVAILABLE_IOS(6_0);
- (void)block_didEndDisplayingCell:(Block_didEndDisplayingCell)block NS_AVAILABLE_IOS(6_0);
- (void)block_didEndDisplayingHeaderView:(Block_didEndDisplayingHeaderView)block NS_AVAILABLE_IOS(6_0);
- (void)block_didEndDisplayingFooterView:(Block_didEndDisplayingFooterView)block NS_AVAILABLE_IOS(6_0);
- (void)block_heightForRowAtIndexPath:(Block_heightForRowAtIndexPath)block;
- (void)block_heightForHeaderInSection:(Block_heightForHeaderInSection)block;
- (void)block_heightForFooterInSection:(Block_heightForFooterInSection)block;
- (void)block_estimatedHeightForRowAtIndexPath:(Block_estimatedHeightForRowAtIndexPath)block NS_AVAILABLE_IOS(7_0);
- (void)block_estimatedHeightForHeaderInSection:(Block_estimatedHeightForHeaderInSection)block NS_AVAILABLE_IOS(7_0);
- (void)block_estimatedHeightForFooterInSection:(Block_estimatedHeightForFooterInSection)block NS_AVAILABLE_IOS(7_0);
- (void)block_viewForHeaderInSection:(Block_viewForHeaderInSection)block;
- (void)block_viewForFooterInSection:(Block_viewForFooterInSection)block;
- (void)block_accessoryButtonTappedForRowWithIndexPath:(Block_accessoryButtonTappedForRowWithIndexPath)block;
- (void)block_shouldHighlightRowAtIndexPath:(Block_shouldHighlightRowAtIndexPath)block NS_AVAILABLE_IOS(6_0);
- (void)block_didHighlightRowAtIndexPath:(Block_didHighlightRowAtIndexPath)block NS_AVAILABLE_IOS(6_0);
- (void)block_didUnhighlightRowAtIndexPath:(Block_didUnhighlightRowAtIndexPath)block NS_AVAILABLE_IOS(6_0);
- (void)block_willSelectRowAtIndexPath:(Block_willSelectRowAtIndexPath)block;
- (void)block_willDeselectRowAtIndexPath:(Block_willDeselectRowAtIndexPath)block NS_AVAILABLE_IOS(3_0);
- (void)block_didSelectRowAtIndexPath:(Block_didSelectRowAtIndexPath)block;
- (void)block_didDeselectRowAtIndexPath:(Block_didDeselectRowAtIndexPath)block NS_AVAILABLE_IOS(3_0);
- (void)block_editingStyleForRowAtIndexPath:(Block_editingStyleForRowAtIndexPath)block;
- (void)block_titleForDeleteConfirmationButtonForRowAtIndexPath:(Block_titleForDeleteConfirmationButtonForRowAtIndexPath)block  NS_AVAILABLE_IOS(3_0);
- (void)block_editActionsForRowAtIndexPath:(Block_editActionsForRowAtIndexPath)block NS_AVAILABLE_IOS(8_0);
- (void)block_shouldIndentWhileEditingRowAtIndexPath:(Block_shouldIndentWhileEditingRowAtIndexPath)block;
- (void)block_willBeginEditingRowAtIndexPath:(Block_willBeginEditingRowAtIndexPath)block;
- (void)block_didEndEditingRowAtIndexPath:(Block_didEndEditingRowAtIndexPath)block;
- (void)block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath:(Block_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath)block;
- (void)block_indentationLevelForRowAtIndexPath:(Block_indentationLevelForRowAtIndexPath)block;
- (void)block_shouldShowMenuForRowAtIndexPath:(Block_shouldShowMenuForRowAtIndexPath)block NS_AVAILABLE_IOS(5_0);
- (void)block_canPerformAction_forRowAtIndexPath_withSender:(Block_canPerformAction_forRowAtIndexPath_withSender)block NS_AVAILABLE_IOS(5_0);
- (void)block_performAction_forRowAtIndexPath_withSender:(Block_performAction_forRowAtIndexPath_withSender)block NS_AVAILABLE_IOS(5_0);
- (void)block_canFocusRowAtIndexPath:(Block_canFocusRowAtIndexPath)block NS_AVAILABLE_IOS(9_0);
- (void)block_shouldUpdateFocusInContext:(Block_shouldUpdateFocusInContext)block NS_AVAILABLE_IOS(9_0);
- (void)block_didUpdateFocusInContext_withAnimationCoordinator:(Block_didUpdateFocusInContext_withAnimationCoordinator)block NS_AVAILABLE_IOS(9_0);
- (void)block_indexPathForPreferredFocusedViewInTableView:(Block_indexPathForPreferredFocusedViewInTableView)block NS_AVAILABLE_IOS(9_0);

#pragma mark InterfaceMethod - UITableViewDragDelegate
- (void)block_itemsForBeginningDragSession_atIndexPath:(Block_itemsForBeginningDragSession_atIndexPath)block API_AVAILABLE(ios(11.0));
- (void)block_itemsForAddingToDragSession_atIndexPath_point:(Block_itemsForAddingToDragSession_atIndexPath_point)block API_AVAILABLE(ios(11.0));
- (void)block_dragPreviewParametersForItemAtIndexPath:(Block_dragPreviewParametersForItemAtIndexPath)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionWillBegin:(Block_dragSessionWillBegin)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionDidEnd:(Block_dragSessionDidEnd)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionAllowsMoveOperation:(Block_dragSessionAllowsMoveOperation)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionIsRestrictedToDraggingApplication:(Block_dragSessionIsRestrictedToDraggingApplication)block API_AVAILABLE(ios(11.0));

#pragma mark InterfaceMethodMethod - UITableViewDropDelegate
- (void)block_performDropWithCoordinator:(Block_performDropWithCoordinator)block API_AVAILABLE(ios(11.0));
- (void)block_canHandleDropSession:(Block_canHandleDropSession)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidEnter:(Block_dropSessionDidEnter)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidUpdate_withDestinationIndexPath:(Block_dropSessionDidUpdate_withDestinationIndexPath)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidExit:(Block_dropSessionDidExit)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidEnd:(Block_dropSessionDidEnd)block API_AVAILABLE(ios(11.0));

#pragma mark InterfaceMethodMethod - UIScrollViewDelegate
- (void)block_scrollViewDidScroll:(Block_scrollViewDidScroll)block;
- (void)block_scrollViewDidZoom:(Block_scrollViewDidZoom)block NS_AVAILABLE_IOS(3_2);
- (void)block_scrollViewWillBeginDragging:(Block_scrollViewWillBeginDragging)block;
- (void)block_scrollViewWillEndDragging_withVelocity_targetContentOffset:(Block_scrollViewWillEndDragging_withVelocity_targetContentOffset)block NS_AVAILABLE_IOS(5_0);
- (void)block_scrollViewDidEndDragging:(Block_scrollViewDidEndDragging)block;
- (void)block_scrollViewWillBeginDecelerating:(Block_scrollViewWillBeginDecelerating)block;
- (void)block_scrollViewDidEndDecelerating:(Block_scrollViewDidEndDecelerating)block;
- (void)block_scrollViewDidEndScrollingAnimation:(Block_scrollViewDidEndScrollingAnimation)block;
- (void)block_viewForZoomingInScrollView:(Block_viewForZoomingInScrollView)block;
- (void)block_scrollViewWillBeginZooming:(Block_scrollViewWillBeginZooming)block NS_AVAILABLE_IOS(3_2);
- (void)block_scrollViewDidEndZooming:(Block_scrollViewDidEndZooming)block;
- (void)block_scrollViewShouldScrollToTop:(Block_scrollViewShouldScrollToTop)block;
- (void)block_scrollViewDidScrollToTop:(Block_scrollViewDidScrollToTop)block;
- (void)block_scrollViewDidChangeAdjustedContentInset:(Block_scrollViewDidChangeAdjustedContentInset)block API_AVAILABLE(ios(11.0), tvos(11.0));

@end
