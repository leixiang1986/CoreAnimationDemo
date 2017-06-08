//
//  CGTileLayerVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/7.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "CATileLayerVC.h"

@interface CATileLayerVC ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (weak, nonatomic) CATiledLayer *tileLayer;
@end

@implementation CATileLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 1242 * 0.5, 2208 * 0.5);
    tileLayer.delegate = self;
    [self.baseScrollView.layer addSublayer:tileLayer];
    tileLayer.contentsScale = [UIScreen mainScreen].scale;


    //configure the scroll view
    self.baseScrollView.contentSize = tileLayer.frame.size;
    _tileLayer = tileLayer;
    //draw layer,调用后滑动才会调用代理方法
    [tileLayer setNeedsDisplay];
}


- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
{
    //determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    NSLog(@"bounds:%@====tileSize:%@",NSStringFromCGRect(bounds),NSStringFromCGSize(layer.tileSize));
#warning currentCtx为nil
//    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
//    NSLog(@"当前的上下文currentCtx:%p ---传入的上下文ctx:%p",currentCtx,ctx);

    CGFloat scale = [UIScreen mainScreen].scale;
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width * scale);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height * scale);
    NSLog(@"scale时:x:%li--y:%li",(long)x,(long)y);
    //load tile image
    NSString *imageName = [NSString stringWithFormat: @"1242x2208_%02i_%02i", x, y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
//    UIImage *tileImage = [UIImage imageNamed:imageName];
    //draw tile

    //绘制图片
    UIGraphicsPushContext(ctx);
    {
#warning currentCtx为ctx
//    CGContextRef currentCtx = UIGraphicsGetCurrentContext();
//    NSLog(@"当前的上下文currentCtx:%p ---传入的上下文ctx:%p",currentCtx,ctx);
    [tileImage drawInRect:bounds];
//    [@"nihao" drawInRect:bounds withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    }
    UIGraphicsPopContext();
}

- (void)dealloc {
    _tileLayer.delegate = nil;
}


@end
