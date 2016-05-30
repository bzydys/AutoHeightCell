//
//  ViewController.m
//  AutoHeight
//
//  Created by Lee on 16/5/30.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
#import "TestModel.h"
#import "UITableViewCell+LeeAutoHeight.h"

static NSString *cellIdentifier = @"CellIdentifier";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *_testTableView;
}

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_testTableView];
    
    _testTableView.dataSource = self;
    
    _testTableView.delegate = self;
    
    _testTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [_testTableView registerClass:[TestCell class] forCellReuseIdentifier:cellIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSMutableArray *)dataSource{
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 30; i++) {
            
            if (i % 2 == 0) {
                
                TestModel *model = [TestModel new];
                
                model.title = @"短的";
                
                model.desc = @"短的";
                
                model.bgColor = [UIColor redColor];
                
                [_dataSource addObject:model];
                
            }else{
                
                TestModel *model = [TestModel new];
                
                model.title = @"长的";
                
                model.desc = @"长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的长的";
                
                model.bgColor = [UIColor blueColor];
                
                [_dataSource addObject:model];
            }
        }
        
        return _dataSource;
    }
    
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    TestModel *model = nil;
    
    if (indexPath.row < self.dataSource.count) {
        
        model = [self.dataSource objectAtIndex:indexPath.row];
        
    }
    
    cell.testModel = model;

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestModel *model = nil;
    
    if (indexPath.row < self.dataSource.count) {
        
        model = [self.dataSource objectAtIndex:indexPath.row];
        
    }
    
    return [TestCell lee_heightForCell:tableView handler:^(UITableViewCell *sourceCell) {
        
        TestCell *cell = (TestCell *)sourceCell;
        
        cell.testModel = model;
    }];
}

@end
