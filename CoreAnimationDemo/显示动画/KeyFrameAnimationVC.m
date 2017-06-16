//
//  KeyFrameAnimationVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/13.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "KeyFrameAnimationVC.h"

@interface KeyFrameAnimationVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) CALayer *shipLayer;
@property (strong, nonatomic) UIBezierPath *bezierPath;
@end

@implementation KeyFrameAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    _bezierPath = bezierPath;
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"toTop.png"].CGImage;
    shipLayer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
    [self.containerView.layer addSublayer:shipLayer];
    //create the keyframe animation
    _shipLayer = shipLayer;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = _bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    
    [_shipLayer addAnimation:animation forKey:nil];
}

@end
