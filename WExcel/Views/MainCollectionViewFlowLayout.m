
//
//  MainCollectionViewFlowLayout.m
//  MyExcel
//
//  Created by Tusky on 2017/7/12.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import "MainCollectionViewFlowLayout.h"
#import "Header.h"

@implementation MainCollectionViewFlowLayout

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.attributes[indexPath.item];
}

//1
- (void)prepareLayout {
    [super prepareLayout];
    if (self.attributes.count > 0) {
        return ;
    }
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        
        UICollectionViewLayoutAttributes * attribute;
        
        if (i == 0) {
            attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
            attribute.frame = CGRectMake(0, 0, ButtonDefaultWidth, ButtonDefaultHeight);
        } else {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            
            UICollectionViewLayoutAttributes *lastAttribute = self.attributes[i-1];
            
            attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            CGFloat x,y;
            CGRect lastFrame = lastAttribute.frame;
            if (CGRectGetMaxX(lastFrame) + ButtonDefaultWidth > self.contentSize.width) {
                x = 0;
                y = CGRectGetMaxY(lastFrame);
            } else {
                x = CGRectGetMaxX(lastFrame);
                y = CGRectGetMinY(lastFrame);
            }
            
            attribute.frame = CGRectMake(x, y, ButtonDefaultWidth, ButtonDefaultHeight);
        }
        
        [self.attributes addObject:attribute];
    }
}

//2,4,6
- (CGSize)collectionViewContentSize {
    return self.contentSize;
    return [super collectionViewContentSize];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return 1;
}

//3,5,7
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributes;
}

- (NSMutableArray<UICollectionViewLayoutAttributes *> *)attributes {
    if (!_attributes) {
        _attributes = [NSMutableArray array];
    }
    return _attributes;
}
@end
