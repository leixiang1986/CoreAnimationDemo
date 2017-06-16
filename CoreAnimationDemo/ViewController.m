//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/2.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ViewController.h"
#import "JointImagesViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];

}


- (UITableView *)tableView {
    if (!_tableView) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    }

    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"拆分图片--contentsRect",@"layer代理--CALayerDelegate",@"图形变换",@"实体对象",@"专用图层",@"隐式动画",@"显式动画",@"CAmediaTiming",@"缓冲CAMediaTimingFunction"];
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
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController performSegueWithIdentifier:@"showJoint" sender:nil];
    }
    else if (indexPath.row == 1) {
        [self.navigationController performSegueWithIdentifier:@"layerDelegate" sender:nil];
    }
    else if (indexPath.row == 2) {
        [self.navigationController performSegueWithIdentifier:@"showTransform" sender:nil];

    }
    else if (indexPath.row == 3) {
        [self.navigationController performSegueWithIdentifier:@"showSolid" sender:nil];
    }
    else if (indexPath.row == 4){
        [self performSegueWithIdentifier:@"showDedicatedLayer" sender:nil];
    }
    else if (indexPath.row == 5) {
        [self performSegueWithIdentifier:@"showImplicitAnimation" sender:nil];
    }
    else if (indexPath.row == 6) {
        [self performSegueWithIdentifier:@"showExplicitAnimation" sender:nil];
    }
    else if (indexPath.row == 7) {
        [self.navigationController performSegueWithIdentifier:@"showCAMediaTiming" sender:nil];
    }
    else if (indexPath.row == 8) {
        [self.navigationController performSegueWithIdentifier:@"showTimingFunction" sender:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
