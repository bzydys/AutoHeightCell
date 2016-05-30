//
//  UITableViewCell+LeeAutoHeight.h
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UITableView+LeeAutoHeight.h"

/**
 * 获取高度前会回调，需要在此BLOCK中配置数据，才能正确地获取高度
 */
typedef void(^LEECellBlock)(UITableViewCell *sourceCell);

@interface UITableViewCell (LeeAutoHeight)

/**
 *指定cell的最底部是哪个view
 */
@property(nonatomic, strong)UIView *lee_bottomViewInCell;


/**
 *指定最底部的view与cell底部的间隙
 */
@property(nonatomic, assign)CGFloat lee_bottomoffset;

/**
 *返回行高
 */
+(CGFloat)lee_heightForCell: (UITableView *)tableView handler: (LEECellBlock)handler;


@end
