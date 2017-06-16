//
//  TimingFunctionOfUIView.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/15.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TimingFunctionOfUIViewVC.h"

@interface TimingFunctionOfUIViewVC ()
@property (nonatomic,strong) UIView *colorView;
@end

@implementation TimingFunctionOfUIViewVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create a red layer
    self.colorView = [[UIView alloc] init];
    self.colorView.bounds = CGRectMake(0, 0, 100, 100);
    self.colorView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.colorView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //perform the animation
    [UIView animateWithDuration:1.0 delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         //set the position
                         self.colorView.center = [[touches anyObject] locationInView:self.view];
                     }
                     completion:NULL];

}

@end
