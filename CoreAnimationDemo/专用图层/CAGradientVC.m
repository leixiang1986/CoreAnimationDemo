//
//  CAGradientVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/7.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "CAGradientVC.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CAGradientVC ()
@property (weak, nonatomic) IBOutlet UIView *layerVIew;

@end

@implementation CAGradientVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self method1];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}

/**
 * 方法一:简单的方式
 */
- (void)method1 {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    layer.bounds = self.layerVIew.bounds;
    layer.position = CGPointMake(self.layerVIew.frame.size.width * 0.5, self.layerVIew.frame.size.height * 0.5);
    [self.layerVIew.layer addSublayer:layer];



}

///**
// * 方法二：三角形
// */
//- (void)method2 {
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.bounds = CGRectMake(0, 0, 200, 300);
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100, 0)];
//    [path addLineToPoint:CGPointMake(0, 300)];
//    [path addLineToPoint:CGPointMake(200, 300)];
//    [path closePath];
//    shapeLayer.path = path.CGPath;
//    shapeLayer.fillColor = [UIColor redColor].CGColor;
// 
////    [path addClip];
//
//    shapeLayer.backgroundColor = [UIColor yellowColor].CGColor;
//    [self.layerVIew.layer addSublayer:shapeLayer];
//    shapeLayer.position = CGPointMake(self.layerVIew.frame.size.width * 0.5, self.layerVIew.frame.size.height * 0.5);
//
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.locations = 
//
//
//
//}



@end
