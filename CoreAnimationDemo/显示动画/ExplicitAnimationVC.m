//
//  ExplicitAnimationVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/12.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ExplicitAnimationVC.h"
#import "PropertyAnimationVC.h"

@interface ExplicitAnimationVC ()<UITableViewDelegate,UITableViewDataSource,UITabBarControllerDelegate>
@property (nonatomic, strong) UITableView *tableView ;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ExplicitAnimationVC

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
        _dataSource = @[@"属性动画",@"关键帧动画",@"动画组",@"转场动画TransitionAnimation",@"转场动画对图层树的动画",@"自定义动画",@"动画过程中取消动画",@"UIView实现的专场动画"];
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

    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [self performSegueWithIdentifier:@"showPropertyAnimation" sender:nil];
        }

            break;
        case 1:
        {
            [self performSegueWithIdentifier:@"showKeyFrameAnimation" sender:nil];
        }
            break;

        case 2:
        {
            [self performSegueWithIdentifier:@"showGroupAnimation" sender:nil];
        }
            break;
            case 3:
        {
            [self performSegueWithIdentifier:@"showTransitionAnimation" sender:nil];
        }
            break;

            case 4:
        {
            [self performSegueWithIdentifier:@"showLayerTree" sender:nil];
        }
            break;
            case 5:
        {
            [self performSegueWithIdentifier:@"showCustomAnimation" sender:nil];
        }
            break;
            case 6:
        {
            [self performSegueWithIdentifier:@"showCancelAnimation" sender:nil];
        }
            break;
            case 7:
        {
            [self performSegueWithIdentifier:@"showUIViewTransition" sender:nil];
        }
            break;
        default:    
            break;
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLayerTree"]) {
        UITabBarController *tabbarVC = segue.destinationViewController;
        tabbarVC.delegate = self;
    }
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (tabBarController.selectedIndex == 0) {
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        //apply transition to tab bar controller's view
        [tabBarController.view.layer addAnimation:transition forKey:nil];
    }
    else {
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionFade;
        //apply transition to tab bar controller's view
        [tabBarController.view.layer addAnimation:transition forKey:nil];
    }
}

@end
