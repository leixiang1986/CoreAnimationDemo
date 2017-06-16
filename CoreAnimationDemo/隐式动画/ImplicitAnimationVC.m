//
//  ImplicitAnimationVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/12.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ImplicitAnimationVC.h"

@interface ImplicitAnimationVC ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) CALayer *colorLayer;
@end

@implementation ImplicitAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 200, 200);
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    colorLayer.position = CGPointMake(self.layerView.frame.size.width * 0.5, self.layerView.frame.size.height * 0.5);
    [self.layerView.layer addSublayer:colorLayer];
    self.colorLayer = colorLayer;
}



- (IBAction)change:(id)sender {
    [self test1changeColor];
}


/**
 * 修改颜色
 */
- (void)test1changeColor {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
#warning 取消隐式动画
//    [CATransaction setDisableActions:YES];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    [CATransaction commit];
}

- (void)test2ChangeColor {
    [CATransaction begin];
    //set the animation duration to 1 second
    [CATransaction setAnimationDuration:1.0];
    //add the spin animation on completion
    [CATransaction setCompletionBlock:^{
        //        [CATransaction setAnimationDuration:1.0];
        //rotate the layer 90 degrees
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    //commit the transaction
    [CATransaction commit];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
