//
//  MainCollectionViewFlowLayout.h
//  MyExcel
//
//  Created by Tusky on 2017/7/12.
//  Copyright © 2017年 Tusky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewFlowLayout : UICollectionViewLayout
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *attributes;
@property (nonatomic) CGSize contentSize;
@end
