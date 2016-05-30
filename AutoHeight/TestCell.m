//
//  TestCell.m
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "TestCell.h"
#import "UITableViewCell+LeeAutoHeight.h"
#import "Masonry.h"

@interface TestCell()

@property(nonatomic, strong)UILabel *titleLbl;

@property(nonatomic, strong)UIImageView *imgView;

@property(nonatomic, strong)UIView *bottomView;

@end

@implementation TestCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
    
    _titleLbl = [[UILabel alloc] init];
    
    [self.contentView addSubview:_titleLbl];
    
    [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        
        make.right.mas_equalTo(-10);
        
        make.top.mas_equalTo(10);
    }];
    
    _imgView = [[UIImageView alloc] init];
    
    [self.contentView addSubview:_imgView];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        
        make.top.mas_equalTo(_titleLbl.mas_bottom).offset(10);
        
        make.width.height.mas_equalTo(60);
    }];
    
    _descLbl = [[UILabel alloc] init];
    
    _descLbl.preferredMaxLayoutWidth = self.contentView.bounds.size.width - 20;
    
    [self.contentView addSubview:_descLbl];
    
    [_descLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_imgView.mas_bottom).offset(10);
        
        make.left.mas_equalTo(10);
        
        make.right.mas_equalTo(-10);
    }];
    
    _descLbl.numberOfLines = 0;
    
    _descLbl.backgroundColor = [UIColor yellowColor];
    
    
    _bottomView = [[UIView alloc] init];
    
    _bottomView.backgroundColor = [UIColor purpleColor];
    
    [self.contentView addSubview:_bottomView];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_descLbl.mas_bottom).offset(10);
        
        make.left.mas_equalTo(10);
        
        make.right.mas_equalTo(-10);
        
        make.height.mas_equalTo(44);
    }];
    
    self.lee_bottomViewInCell = _bottomView;
    
    self.lee_bottomoffset = 10;
    
    
}


-(void)setTestModel:(TestModel *)testModel{
    
    _testModel = testModel;
    
    self.titleLbl.text = testModel.title;
    
    self.descLbl.text = testModel.desc;
    
    self.imgView.backgroundColor = testModel.bgColor;

}



@end
