//
//  DedicatedViewController.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/6.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "DedicatedViewController.h"
//专用图层
@interface DedicatedViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation DedicatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];


}

- (UITableView *)tableView {
    if (!_tableView) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - 64) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }

    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSArray alloc] init];
        

    }

    return _dataSource;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
