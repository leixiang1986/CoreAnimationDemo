//
//  TimingFunctionOfCALayer.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/15.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TimingFunctionOfCALayer.h"

@interface TimingFunctionOfCALayer ()
@property (nonatomic, strong) CALayer *colorLayer;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UIButton *transactionSelectBtn;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation TimingFunctionOfCALayer

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create a red layer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    self.chooseBtn.selected = YES;
}

- (IBAction)selected:(id)sender {
    if (sender == self.chooseBtn) {
        self.chooseBtn.selected = YES;
        self.transactionSelectBtn.selected = NO;
    }
    else if (sender == self.transactionSelectBtn) {
        self.chooseBtn.selected = NO;
        self.transactionSelectBtn.selected = YES;
    }
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //configure the transaction
    if (self.chooseBtn.selected) {


        CGPoint point = [[touches anyObject] locationInView:self.view];

        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"position";
        ;
        NSLog(@"起始点%@",NSStringFromCGPoint(self.colorLayer.position));
        CABasicAnimation *baseAnimation = (CABasicAnimation *)[self.colorLayer animationForKey:@"animation"];
        NSLog(@"动画的tovalue:%@",baseAnimation.toValue);
        if (baseAnimation) {
#warning 快速点击时上一个动画还没完成，应该以presentationLayer的位置为起点重新添加动画
            NSValue *fromValue = [NSValue valueWithCGPoint:self.colorLayer.presentationLayer.position];
            NSLog(@"presentationLayer:%@",self.colorLayer.presentationLayer);
            animation.fromValue = fromValue;

        }

        animation.toValue =  [NSValue valueWithCGPoint:point];
        animation.duration = 1.0;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [self.colorLayer addAnimation:animation forKey:@"animation"];
        self.statusLabel.text = @"当前为:CABasicAnimation实现，快速多次点击，用隐式动画效果更好";
    }
    else {
        //添加这一句是上面layer添加了动画，并且设置了animation.removedOnCompletion = NO;
        [self.colorLayer removeAllAnimations];
        [CATransaction begin];
        [CATransaction setAnimationDuration:1.0];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        //set the position
        self.colorLayer.position = [[touches anyObject] locationInView:self.view];
        //commit transaction
        [CATransaction commit];
        NSLog(@"事务实现");
        self.statusLabel.text = @"当前为:CATransaction实现";
    }
}

@end
