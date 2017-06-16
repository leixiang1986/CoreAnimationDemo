//
//  PresentationLayer.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/12.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "PresentationLayerVC.h"

@interface PresentationLayerVC ()
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation PresentationLayerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create a red layer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [self.colorLayer modelLayer];
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //check if we've tapped the moving layer
#warning 注意presentationLayer 是移动过程中的layer，属性变化后，值是当时就改变了，但是显示动画的过程是通过presentationLayer来完成的,如果换成[self.colorLayer hitTest:point] 就打不到这个效果
//    if ([self.colorLayer hitTest:point]) {

    if ([self.colorLayer.presentationLayer hitTest:point]) {
        //randomize the layer background color
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;

    } else {
        //otherwise (slowly) move the layer to new position
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

@end
