//
//  PropertyAnimationVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/13.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "PropertyAnimationVC.h"

//属性动画
@interface PropertyAnimationVC ()<CAAnimationDelegate,CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation PropertyAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.colorLayer];

}


- (IBAction)changeColor
{
    //方法一:基本动画改变颜色
    [self changeColorOfBasicAnimation];

    //    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    //    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 30)];
}

- (IBAction)keyframeAnimation:(id)sender {
    //方法二:关键帧动画改变颜色
    [self changeColorOfKeyFrameAnimation];
}

/**
 * 关键帧动画改变颜色
 */
- (void)changeColorOfKeyFrameAnimation {
    CAKeyframeAnimation *animaiton = [CAKeyframeAnimation animation];
    animaiton.keyPath = @"backgroundColor";
    animaiton.duration = 2;
    animaiton.values = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor purpleColor].CGColor];
    animaiton.removedOnCompletion = NO;
    animaiton.fillMode = kCAFillModeForwards;
    [self.colorLayer addAnimation:animaiton forKey:nil];
}


/**
 * 基本动画改变颜色
 */
- (void)changeColorOfBasicAnimation {
    //create a new random color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //create a basic animation
    //    CABasicAnimation *animation = [CABasicAnimation animation];
    //    animation.keyPath = @"backgroundColor";

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.duration = 2;
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];

    animation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
    //方式1:通过代理设置结束时的layer状态
    //    animation.toValue = (__bridge id)color.CGColor;
    //    animation.delegate = self;
    //方式2:通过动画属性设置结束时的layer状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;

    //apply animation to layer
    //动画加在layer上的时候开始执行
    [self.colorLayer addAnimation:animation forKey:nil];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//    });
}


/**
 * 动画代理
 */
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    //set the backgroundColor property to match animation toValue
    NSLog(@"动画完成%ld",flag);
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;

    self.colorLayer.bounds = [anim.toValue CGRectValue];
//    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 30)];
    [CATransaction commit];
}

- (void)dealloc {

}





@end
