//
//  ViewController.m
//  布局
//
//  Created by 三 on 2016/11/23.
//  Copyright © 2016年 三. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "TableViewModel.h"
#import "TableViewFrameModel.h"
#import "AdaptiveCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong ,nullable) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSMutableArray *infoModel;
@property (nonatomic, strong) NSMutableArray *infoFrameModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.infoModel = @[].mutableCopy;
    self.infoFrameModel = @[].mutableCopy;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"infoModel" ofType:@"plist"];
    self.items = [NSArray arrayWithContentsOfFile:path];
    NSArray *model = [TableViewModel mj_objectArrayWithKeyValuesArray:self.items];
    for (TableViewModel *infomodel in model) {
        TableViewFrameModel *frameModel = [[TableViewFrameModel alloc] init];
        frameModel.model = infomodel;
        [_infoFrameModel addObject:frameModel];
    }
}

#pragma mark - tableView数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoFrameModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"cell";
    AdaptiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[AdaptiveCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.frameModel = self.infoFrameModel[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewFrameModel *frame = self.infoFrameModel[indexPath.row];
    return frame.cellHeight;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = [UIScreen mainScreen].bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
