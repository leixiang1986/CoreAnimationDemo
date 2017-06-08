//
//  TransformViewController.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/5.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"640X960"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;

    self.leftView.layer.contents = (__bridge id)image.CGImage;
    //doubleSided超过90度会消失掉,反面不会绘制
//    self.leftView.layer.doubleSided = NO;
    self.rightView.layer.contents = (__bridge id)image.CGImage;
#warning 设置了代理，变换动画就无效了
    self.leftView.layer.delegate = self; //设置了代理，变换动画就无效了

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
    [self.layerView addGestureRecognizer:tap];

    NSLog(@"==%@",NSStringFromCGRect(tap.view.frame));
}

- (void)taped:(UITapGestureRecognizer *)tap {
    NSLog(@"点击到了");

    NSLog(@"==%@",NSStringFromCGRect(tap.view.frame));



}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test2sublayerTransform];
}

/**
 * 透视
 */
- (void)test1perspective {
    __block CATransform3D transform1;
    [UIView animateWithDuration:2 animations:^{
        transform1 = CATransform3DMakeRotation(3.14159265, 0, 1, 0);
        transform1.m34 = -1 / 1000.0;

        self.layerView.layer.transform = CATransform3DConcat(transform1, self.layerView.layer.transform);

    } completion:^(BOOL finished) {
        
        
    }];
}

/**
 * 通过sublayerTransform设置共同的m34属性
 */
- (void)test2sublayerTransform{
    [UIView animateWithDuration:2 animations:^{
        //通过sublayerTransform设置共同的m34属性
        CATransform3D perspective = CATransform3DIdentity;
        perspective.m34 = - 1.0 / 500.0;
        self.containView.layer.sublayerTransform = perspective;
        //如果反转180度，图上的字是反的
        CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
        self.leftView.layer.transform = transform1;
        //rotate layerView2 by 45 degrees along the Y axis
        CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
        self.rightView.layer.transform = transform2;

    }];
    NSLog(@"test2sublayerTransform");
    [self.leftView.layer display];  //强制重绘彩绘执行代理方法
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    //绘制有效
//    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextSetLineWidth(ctx, 5);
//    CGContextAddEllipseInRect(ctx, layer.bounds);
//    CGContextStrokePath(ctx); //需要执行绘制
//    [str drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]}];
//    CGContextSetTextPosition(ctx, 10, 10);
#warning 设置内容无效 currentCtx为nil
//    CGContextRef currentCtx = UIGraphicsGetCurrentContext();

    //设置内容无效
    UIGraphicsPushContext(ctx);
    UIImage *image = [UIImage imageNamed:@"1242x2208"];
    [image drawAtPoint:CGPointZero];
//    layer.contents = image;
    UIGraphicsPopContext();
}


- (void)dealloc {
    self.leftView.layer.delegate = nil;
}

@end
