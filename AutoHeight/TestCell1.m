//
//  TestCell1.m
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "TestCell1.h"

#import "UITableViewCell+LeeAutoHeight.h"
@interface TestCell1()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;

@end

@implementation TestCell1


-(void)setTestModel:(TestModel *)testModel{
    
    _testModel = testModel;
    
    self.titleLbl.text = testModel.title;
    
    self.descLbl.text = testModel.desc;
    
    self.descLbl.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
    self.imgView.backgroundColor = testModel.bgColor;
    
}


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.lee_bottomViewInCell = self.bottomBtn;
    
    self.lee_bottomoffset = 20;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
