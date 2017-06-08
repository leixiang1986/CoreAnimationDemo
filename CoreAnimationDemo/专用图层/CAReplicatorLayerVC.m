//
//  CAReplicatorLayerVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/6.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "CAReplicatorLayerVC.h"

@interface CAReplicatorLayerVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CAReplicatorLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];

    //configure the replicator
    replicator.instanceCount = 20;

    //apply a transform for each instance
    CATransform3D transform = CATransform3DIdentity;
//    transform = CATransform3DTranslate(transform, 0, 50, 0);
    transform = CATransform3DRotate(transform, M_PI / 10.0, 0, 0, 1);
//    transform = CATransform3DTranslate(transform, 0, -50, 0);
    replicator.instanceTransform = transform;

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.fromValue = @1;
    animation.toValue = @0.5;
    animation.keyPath = @"transform.scale";
    animation.duration = 2.0;
    animation.repeatCount = MAXFLOAT;
    animation.fillMode = kCAFillModeBackwards;
    animation.removedOnCompletion = NO;

    //apply a color shift for each instance
    replicator.instanceBlueOffset = -0.05;
    replicator.instanceGreenOffset = -0.05;
    replicator.instanceDelay = 0.05;

    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50.0f, 50.0f, 30.0f, 30.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [layer addAnimation:animation forKey:@"test"];
    [replicator addSublayer:layer];


}


@end
