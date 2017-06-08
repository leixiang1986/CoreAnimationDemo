//
//  LayerDelegateOfCustomDrawVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/2.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "LayerDelegateOfCustomDrawVC.h"

@interface LayerDelegateOfCustomDrawVC ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet ReDrawView *layerView;
@property (weak, nonatomic) CALayer *blueLayer;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *customBtn;

@end

@implementation LayerDelegateOfCustomDrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CALayer *blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(50, 50, 140, 140);
    blueLayer.delegate = self;  //设置代理
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layerView.layer addSublayer:blueLayer];
    _blueLayer = blueLayer;
    [blueLayer display]; //layer强制重绘

    self.btn.alpha = 0.5;
    self.customBtn.alpha = 0.5;

}

/**
 * 4,代理方法，执行display后的代理
 */
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    CGContextAddEllipseInRect(ctx, layer.bounds);
    CGContextStrokePath(ctx); //需要执行绘制
}

- (void)dealloc {
    _blueLayer.delegate = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //1，为layer发送事件
//    [_blueLayer actionForKey:@"测试"];
    //3,强制重绘
    [_blueLayer display]; //强制重绘
}

/**
 * 2，代理方法,为layer发送事件后,事件的相应
 */
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    //有一些是系统默认的事件
    NSLog(@"====%@",event);
    return nil;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
