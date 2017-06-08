//
//  FlatViewController.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/6.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "FlatViewController.h"

@interface FlatViewController ()
@property (weak, nonatomic) IBOutlet UIView *innerView;
@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *views;

@end

@implementation FlatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self method2];

}

/**
 * 平面的旋转,外部正的45度，内部负的45度,结果是内部的没有变化
 */
- (void)method1 {
    [UIView animateWithDuration:2 animations:^{
        //rotate the outer layer 45 degrees
        CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        self.outerView.layer.transform = outer;
        //rotate the inner layer -45 degrees
        CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        self.innerView.layer.transform = inner;
    }];
}

/**
 * 立体的旋转，立体时，其实是希望内部也做相应改变,立体时做了扁平化处理
 */
- (void)method2 {
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = -1.0 / 500.0;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    self.outerView.layer.transform = outer;
    //rotate the inner layer -45 degrees
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = -1.0 / 500.0;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    self.innerView.layer.transform = inner;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
