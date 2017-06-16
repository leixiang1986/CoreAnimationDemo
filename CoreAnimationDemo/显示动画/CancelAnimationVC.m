//
//  CancelAnimationVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/13.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "CancelAnimationVC.h"

@interface CancelAnimationVC ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) CALayer *shipLayer;
@end

@implementation CancelAnimationVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    //add the ship
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(150, 150);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"toTop.png"].CGImage;
    [self.containerView.layer addSublayer:self.shipLayer];
}

- (IBAction)start
{
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI );
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
}

- (IBAction)stop
{
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
}

/**
 * 自动完成动画flag为YES，停止动画flag为NO
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //log that the animation stopped
    NSLog(@"The animation stopped (finished: %@)---%@", flag? @"YES": @"NO",[self.shipLayer animationForKey:@"rotateAnimation"]);
}



@end
