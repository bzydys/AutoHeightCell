//
//  UITableView+LeeAutoHeight.m
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "UITableView+LeeAutoHeight.h"

const void *lee_reuseCellsKey = "lee_reuseCellsKey";

@implementation UITableView (LeeAutoHeight)


-(void)setLee_reuseCells:(NSMutableDictionary *)lee_reuseCells{
    
    objc_setAssociatedObject(self, lee_reuseCellsKey, lee_reuseCells, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableDictionary *)lee_reuseCells{
    
    NSMutableDictionary *cells = objc_getAssociatedObject(self, lee_reuseCellsKey);
    
    if (!cells) {
        
        cells = [NSMutableDictionary dictionary];
        
        objc_setAssociatedObject(self, lee_reuseCellsKey, cells, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return cells;
}

@end
