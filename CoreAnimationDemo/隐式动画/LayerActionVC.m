//
//  LayerActionVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/12.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "LayerActionVC.h"

@interface LayerActionVC ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation LayerActionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add a custom action
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
//    self.colorLayer.actions = @{@"backgroundColor": transition,@"position":transition};
    //动画行为,改变背景颜色的过渡动画
    self.colorLayer.actions = @{@"backgroundColor": transition};
    //add it to our view
    [self.layerView.layer addSublayer:self.colorLayer];
}



- (IBAction)changeColor
{
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;

#warning 位置也有动画
//    self.colorLayer.position = CGPointMake(self.layerView.frame.size.width * 0.5 + arc4random() % 20, self.layerView.frame.size.height * 0.5 + arc4random() % 20);

}



@end
