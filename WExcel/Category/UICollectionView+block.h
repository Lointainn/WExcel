//
//  UICollectionView+block.h
//  MyExcel
//
//  Created by Wu on 2017/7/11.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - @interface
@interface UICollectionView (block) <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching, UICollectionViewDragDelegate, UICollectionViewDropDelegate>

#pragma mark - Block - UICollectionViewDataSource
typedef NSInteger (^Block_numberOfItemsInSection)(UICollectionView *collectionView, NSInteger section);
typedef UICollectionViewCell * (^Block_cellForItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef NSInteger (^Block_numberOfSectionsInCollectionView)(UICollectionView *collectionView);
typedef UICollectionReusableView * (^Block_viewForSupplementaryElementOfKind_atIndexPath)(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath);
typedef BOOL (^Block_canMoveItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(9_0);
typedef void (^Block_moveItemAtIndexPath_toIndexPath)(UICollectionView *collectionView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath) NS_AVAILABLE_IOS(9_0);
typedef NSArray<NSString *> * (^Block_indexTitlesForCollectionView)(UICollectionView *collectionView) API_AVAILABLE(tvos(10.2));
typedef NSIndexPath * (^Block_indexPathForIndexTitle_atIndex)(UICollectionView *collectionView, NSString *title, NSInteger index) API_AVAILABLE(tvos(10.2));

#pragma mark Block - UICollectionViewDataSourcePrefetching
typedef void (^Block_prefetchItemsAtIndexPaths)(UICollectionView *collectionView, NSArray <NSIndexPath *> *indexPaths) NS_AVAILABLE_IOS(10_0);
typedef void (^Block_cancelPrefetchingForItemsAtIndexPaths)(UICollectionView *collectionView, NSArray <NSIndexPath *> *indexPaths) NS_AVAILABLE_IOS(10_0);

#pragma mark Block - UICollectionViewDelegate
typedef BOOL (^Block_shouldHighlightItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didHighlightItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didUnhighlightItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldSelectItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldDeselectItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didSelectItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_didDeselectItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void (^Block_willDisplayCell_forItemAtIndexPath)(UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath) NS_AVAILABLE_IOS(8_0);
typedef void (^Block_willDisplaySupplementaryView_forElementKind_atIndexPath)(UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath) NS_AVAILABLE_IOS(8_0);
typedef void (^Block_didEndDisplayingCell_forItemAtIndexPath)(UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath);
typedef void (^Block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath)(UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath);
typedef BOOL (^Block_shouldShowMenuForItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef BOOL (^Block_canPerformAction_forItemAtIndexPath_withSender)(UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender);
typedef void (^Block_performAction_forItemAtIndexPath_withSender)(UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender);
typedef UICollectionViewTransitionLayout * (^Block_transitionLayoutForOldLayout_newLayout)(UICollectionView *collectionView, UICollectionViewLayout *fromLayout, UICollectionViewLayout *toLayout);
typedef BOOL (^Block_canFocusItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath) NS_AVAILABLE_IOS(9_0);
typedef BOOL (^Block_shouldUpdateFocusInContext_)(UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context) NS_AVAILABLE_IOS(9_0);
typedef void (^Block_didUpdateFocusInContext_withAnimationCoordinator_)(UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator) NS_AVAILABLE_IOS(9_0);
typedef NSIndexPath * (^Block_indexPathForPreferredFocusedViewInCollectionView)(UICollectionView *collectionView) NS_AVAILABLE_IOS(9_0);
typedef NSIndexPath * (^Block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath)(UICollectionView *collectionView, NSIndexPath *originalIndexPath, NSIndexPath *proposedIndexPath) NS_AVAILABLE_IOS(9_0);
typedef CGPoint (^Block_targetContentOffsetForProposedContentOffset)(UICollectionView *collectionView, CGPoint proposedContentOffset) NS_AVAILABLE_IOS(9_0);

#pragma mark Block - UICollectionViewDelegateFlowLayout
typedef CGSize (^Block_layout_sizeForItemAtIndexPath)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath);
typedef UIEdgeInsets (^Block_layout_insetForSectionAtIndex)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGFloat (^Block_layout_minimumLineSpacingForSectionAtIndex)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGFloat (^Block_layout_minimumInteritemSpacingForSectionAtIndex)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGSize (^Block_layout_referenceSizeForHeaderInSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGSize (^Block_layout_referenceSizeForFooterInSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);

#pragma mark Block - UICollectionViewDragDelegate
typedef NSArray<UIDragItem *> * (^Block_itemsForBeginningDragSession_atIndexPath_)(UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *indexPath) API_AVAILABLE(ios(11.0));
typedef NSArray<UIDragItem *> * (^Block_itemsForAddingToDragSession_atIndexPath_point_)(UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *indexPath , CGPoint point) API_AVAILABLE(ios(11.0));
typedef UIDragPreviewParameters * (^Block_dragPreviewParametersForItemAtIndexPath_)(UICollectionView *collectionView, NSIndexPath *indexPath) API_AVAILABLE(ios(11.0));
typedef void (^Block_dragSessionWillBegin_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef void (^Block_dragSessionDidEnd_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef BOOL (^Block_dragSessionAllowsMoveOperation_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef BOOL (^Block_dragSessionIsRestrictedToDraggingApplication_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));

#pragma mark Block - UICollectionViewDropDelegate
typedef void (^Block_performDropWithCoordinator_)(UICollectionView *collectionView, id<UICollectionViewDropCoordinator> coordinator) API_AVAILABLE(ios(11.0));
typedef BOOL (^Block_canHandleDropSession_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef void (^Block_dropSessionDidEnter_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef UICollectionViewDropProposal * (^Block_dropSessionDidUpdate_withDestinationIndexPath_)(UICollectionView *collectionView, id<UIDragSession> session, NSIndexPath *destinationIndexPath) API_AVAILABLE(ios(11.0));
typedef void (^Block_dropSessionDidExit_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));
typedef void (^Block_dropSessionDidEnd_)(UICollectionView *collectionView, id<UIDragSession> session) API_AVAILABLE(ios(11.0));

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

#pragma mark - InterfaceMethod - UICollectionViewDataSource
- (void)block_numberOfItemsInSection:(Block_numberOfItemsInSection)block;
- (void)block_cellForItemAtIndexPath:(Block_cellForItemAtIndexPath)block;
- (void)block_numberOfSectionsInCollectionView:(Block_numberOfSectionsInCollectionView)block;
- (void)block_viewForSupplementaryElementOfKind_atIndexPath:(Block_viewForSupplementaryElementOfKind_atIndexPath)block;
- (void)block_canMoveItemAtIndexPath:(Block_canMoveItemAtIndexPath)block NS_AVAILABLE_IOS(9_0);
- (void)block_moveItemAtIndexPath_toIndexPath:(Block_moveItemAtIndexPath_toIndexPath)block NS_AVAILABLE_IOS(9_0);
- (void)block_indexTitlesForCollectionView:(Block_indexTitlesForCollectionView)block API_AVAILABLE(tvos(10.2));
- (void)block_indexPathForIndexTitle_atIndex:(Block_indexPathForIndexTitle_atIndex)block API_AVAILABLE(tvos(10.2));

#pragma mark InterfaceMethod - UICollectionViewDataSourcePrefetching
- (void)block_prefetchItemsAtIndexPaths:(Block_prefetchItemsAtIndexPaths)block NS_AVAILABLE_IOS(10_0);
- (void)block_cancelPrefetchingForItemsAtIndexPaths:(Block_cancelPrefetchingForItemsAtIndexPaths)block NS_AVAILABLE_IOS(10_0);

#pragma mark InterfaceMethod - UICollectionViewDelegate
- (void)block_shouldHighlightItemAtIndexPath:(Block_shouldHighlightItemAtIndexPath)block;
- (void)block_didHighlightItemAtIndexPath:(Block_didHighlightItemAtIndexPath)block;
- (void)block_didUnhighlightItemAtIndexPath:(Block_didUnhighlightItemAtIndexPath)block;
- (void)block_shouldSelectItemAtIndexPath:(Block_shouldSelectItemAtIndexPath)block;
- (void)block_shouldDeselectItemAtIndexPath:(Block_shouldDeselectItemAtIndexPath)block;
- (void)block_didSelectItemAtIndexPath:(Block_didSelectItemAtIndexPath)block;
- (void)block_didDeselectItemAtIndexPath:(Block_didDeselectItemAtIndexPath)block;
- (void)block_willDisplayCell_forItemAtIndexPath:(Block_willDisplayCell_forItemAtIndexPath)block NS_AVAILABLE_IOS(8_0);
- (void)block_willDisplaySupplementaryView_forElementKind_atIndexPath:(Block_willDisplaySupplementaryView_forElementKind_atIndexPath)block NS_AVAILABLE_IOS(8_0);
- (void)block_didEndDisplayingCell_forItemAtIndexPath:(Block_didEndDisplayingCell_forItemAtIndexPath)block;
- (void)block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath:(Block_didEndDisplayingSupplementaryView_forElementOfKind_atIndexPath)block;
- (void)block_shouldShowMenuForItemAtIndexPath:(Block_shouldShowMenuForItemAtIndexPath)block;
- (void)block_canPerformAction_forItemAtIndexPath_withSender:(Block_canPerformAction_forItemAtIndexPath_withSender)block;
- (void)block_performAction_forItemAtIndexPath_withSender:(Block_performAction_forItemAtIndexPath_withSender)block;
- (void)block_transitionLayoutForOldLayout_newLayout:(Block_transitionLayoutForOldLayout_newLayout)block;
- (void)block_canFocusItemAtIndexPath:(Block_canFocusItemAtIndexPath)block NS_AVAILABLE_IOS(9_0);
- (void)block_shouldUpdateFocusInContext:(Block_shouldUpdateFocusInContext_)block NS_AVAILABLE_IOS(9_0);
- (void)block_didUpdateFocusInContext_withAnimationCoordinator:(Block_didUpdateFocusInContext_withAnimationCoordinator_)block NS_AVAILABLE_IOS(9_0);
- (void)block_indexPathForPreferredFocusedViewInCollectionView:(Block_indexPathForPreferredFocusedViewInCollectionView)block NS_AVAILABLE_IOS(9_0);
- (void)block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath:(Block_targetIndexPathForMoveFromItemAtIndexPath_toProposedIndexPath)block NS_AVAILABLE_IOS(9_0);
- (void)block_targetContentOffsetForProposedContentOffset:(Block_targetContentOffsetForProposedContentOffset)block NS_AVAILABLE_IOS(9_0);

#pragma mark InterfaceMethod - UICollectionViewDelegateFlowLayout
- (void)block_layout_sizeForItemAtIndexPath:(Block_layout_sizeForItemAtIndexPath)block;
- (void)block_layout_insetForSectionAtIndex:(Block_layout_insetForSectionAtIndex)block;
- (void)block_layout_minimumLineSpacingForSectionAtIndex:(Block_layout_minimumLineSpacingForSectionAtIndex)block;
- (void)block_layout_minimumInteritemSpacingForSectionAtIndex:(Block_layout_minimumInteritemSpacingForSectionAtIndex)block;
- (void)block_layout_referenceSizeForHeaderInSection:(Block_layout_referenceSizeForHeaderInSection)block;
- (void)block_layout_referenceSizeForFooterInSection:(Block_layout_referenceSizeForFooterInSection)block;

#pragma mark InterfaceMethod - UICollectionViewDragDelegate
- (void)block_itemsForBeginningDragSession_atIndexPath:(Block_itemsForBeginningDragSession_atIndexPath_)block API_AVAILABLE(ios(11.0));
- (void)block_itemsForAddingToDragSession_atIndexPath_point:(Block_itemsForAddingToDragSession_atIndexPath_point_)block API_AVAILABLE(ios(11.0));
- (void)block_dragPreviewParametersForItemAtIndexPath:(Block_dragPreviewParametersForItemAtIndexPath_)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionWillBegin:(Block_dragSessionWillBegin_)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionDidEnd:(Block_dragSessionDidEnd_)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionAllowsMoveOperation:(Block_dragSessionAllowsMoveOperation_)block API_AVAILABLE(ios(11.0));
- (void)block_dragSessionIsRestrictedToDraggingApplication:(Block_dragSessionIsRestrictedToDraggingApplication_)block API_AVAILABLE(ios(11.0));

#pragma mark InterfaceMethod - UICollectionViewDropDelegate
- (void)block_performDropWithCoordinator:(Block_performDropWithCoordinator_)block API_AVAILABLE(ios(11.0));
- (void)block_canHandleDropSession:(Block_canHandleDropSession_)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidEnter:(Block_dropSessionDidEnter_)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidUpdate_withDestinationIndexPath:(Block_dropSessionDidUpdate_withDestinationIndexPath_)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidExit:(Block_dropSessionDidExit_)block API_AVAILABLE(ios(11.0));
- (void)block_dropSessionDidEnd:(Block_dropSessionDidEnd_)block API_AVAILABLE(ios(11.0));

#pragma mark InterfaceMethod - UIScrollViewDelegate
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
