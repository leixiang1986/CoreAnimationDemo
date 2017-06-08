//
//  JointImagesViewController.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/2.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "JointImagesViewController.h"

@interface JointImagesViewController ()
@property (nonatomic, strong) UIView *layerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView0;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation JointImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //layer的contentsRect属性宽高在0~1之间,用于显示整个图片的范围
    self.title = @"拆分图片";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"640X960"];

    self.imageView.image = image;
}

- (IBAction)click:(id)sender {

    [self addSpriteImage:self.imageView.image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.imageView0.layer];
    [self addSpriteImage:self.imageView.image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.imageView1.layer];
    [self addSpriteImage:self.imageView.image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.imageView2.layer];
    [self addSpriteImage:self.imageView.image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.imageView3.layer];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _layerView.center = self.view.center;
}

- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _layerView.backgroundColor = [UIColor lightGrayColor];
    }

    return _layerView;
}

#pragma mark - 拼合方法

/**
 * 把图片的rect部分添加到layer上,rect的宽高最大值为1.
 */
- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer{
    if (!image) {
        return;
    }
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsRect = rect;
    layer.contentsGravity = kCAGravityResizeAspect;
}

@end
