//
//  TimingFunctionOfKeyframeVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/15.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TimingFunctionOfKeyframeVC.h"

@interface TimingFunctionOfKeyframeVC ()
@property (nonatomic, weak) IBOutlet UIView *layerView;
@property (nonatomic, weak) CALayer *colorLayer;
@end

@implementation TimingFunctionOfKeyframeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create sublayer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (IBAction)changeColor
{
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //add timing function
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    animation.timingFunctions = @[fn, fn, fn];
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}

@end
