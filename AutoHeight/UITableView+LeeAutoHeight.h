//
//  UITableView+LeeAutoHeight.h
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITableView (LeeAutoHeight)


@property(nonatomic, readonly, strong)NSMutableDictionary *lee_reuseCells;

@end
