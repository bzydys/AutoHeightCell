//
//  UITableViewCell+LeeAutoHeight.m
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "UITableViewCell+LeeAutoHeight.h"

const void *lee_lastViewInCellKey = "lee_lastViewInCell";

const void *lee_bottomoffsetKey = "lee_bottomoffset";

@implementation UITableViewCell (LeeAutoHeight)


-(void)setLee_bottomViewInCell:(UIView *)lee_bottomViewInCell{
    
    objc_setAssociatedObject(self, lee_lastViewInCellKey, lee_bottomViewInCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(UIView *)lee_bottomViewInCell{
    
    return objc_getAssociatedObject(self, lee_lastViewInCellKey);
}


-(void)setLee_bottomoffset:(CGFloat)lee_bottomoffset{
    
    objc_setAssociatedObject(self, lee_bottomoffsetKey, @(lee_bottomoffset), OBJC_ASSOCIATION_ASSIGN);
}

-(CGFloat)lee_bottomoffset{
    
    return [objc_getAssociatedObject(self, lee_bottomoffsetKey) floatValue];
}

-(CGFloat)private_lee_heightForCell:(UITableView *)tableView{
    
    //强制布局获取位置
    [self layoutIfNeeded];
    
    NSLog(@"%f", self.lee_bottomViewInCell.frame.origin.y);
    
    CGFloat rowHeight = self.lee_bottomViewInCell.frame.size.height + self.lee_bottomViewInCell.frame.origin.y;
    
    rowHeight += self.lee_bottomoffset;
    
    //NSLog(@"%f", rowHeight);
    
    return rowHeight;
}

+(CGFloat)lee_heightForCell:(UITableView *)tableView handler:(LEECellBlock)handler{
    
    UITableViewCell *cell = [tableView.lee_reuseCells objectForKey:[[self class] description]];
    
    if (!cell) {
        
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                           reuseIdentifier:nil];
        [tableView.lee_reuseCells setObject:cell forKey:[[self class] description]];
    }
    
    if (handler) {
        
        handler(cell);
    }
    
    return [cell private_lee_heightForCell:tableView];
}

@end
