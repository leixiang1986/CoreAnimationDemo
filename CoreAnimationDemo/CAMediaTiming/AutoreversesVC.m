//
//  AutoreversesVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/14.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "AutoreversesVC.h"

@interface AutoreversesVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation AutoreversesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 128, 256);
    doorLayer.position = CGPointMake(150 - 64, 150);
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.contents = (__bridge id)[UIImage imageNamed: @"1242x2208.png"].CGImage;
    [self.containerView.layer addSublayer:doorLayer];
    //apply perspective transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
#warning 这里是子layer的转换sublayerTransform
    self.containerView.layer.sublayerTransform = perspective;
//    doorLayer.transform = perspective;
    if ([self.containerView.layer.sublayers objectAtIndex:0] == doorLayer) {
        NSLog(@"只有doorLayer");
    }
    NSLog(@"数量:%ld",self.containerView.layer.sublayers.count);

    //apply swinging animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}



@end
