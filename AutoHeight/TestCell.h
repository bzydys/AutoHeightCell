//
//  TestCell.h
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"

@interface TestCell : UITableViewCell

@property(nonatomic, strong)TestModel *testModel;

@property(nonatomic, strong)UILabel *descLbl;

@end
