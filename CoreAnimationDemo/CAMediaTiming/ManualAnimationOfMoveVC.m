//
//  ManualAnimationOfMoveVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/15.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ManualAnimationOfMoveVC.h"

@interface ManualAnimationOfMoveVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) CALayer *doorLayer;
@end

@implementation ManualAnimationOfMoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.doorLayer = [CALayer layer];
    self.doorLayer.frame = CGRectMake(0, 0, 128, 128);
    self.doorLayer.position = CGPointMake(150 - 64, 150);
//    self.doorLayer.anchorPoint = CGPointMake(0, 0.5);
    self.doorLayer.contents = (__bridge id)[UIImage imageNamed:@"toTop.png"].CGImage;
    [self.containerView.layer addSublayer:self.doorLayer];
    //apply perspective transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.containerView.layer.sublayerTransform = perspective;
    //add pan gesture recognizer to handle swipes
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    //pause all layer animations
    self.doorLayer.speed = 0.0;
    //apply swinging animation (which won't play because layer is paused)
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.toValue = @(450);
    animation.fromValue = @(0);
    animation.duration = 1.0;
    
    [self.doorLayer addAnimation:animation forKey:nil];
}


- (void)pan:(UIPanGestureRecognizer *)pan
{
    //get horizontal component of pan gesture
    CGFloat y = [pan translationInView:self.view].y;
    //convert from points to animation duration //using a reasonable scale factor
    NSLog(@"1111---y:%f",y);
    y /= 400.0f;
    //update timeOffset and clamp result
    CFTimeInterval oldtimeOffset = self.doorLayer.timeOffset;
    NSLog(@"2222timeOffset:%f---y:%f",oldtimeOffset,y);
    CFTimeInterval timeOffset = MIN(0.999, MAX(0.0, oldtimeOffset + y ));
    NSLog(@"3333timeOffset:%f",timeOffset);
    self.doorLayer.timeOffset = timeOffset;

    //reset pan gesture
    [pan setTranslation:CGPointZero inView:self.view];
}



@end
