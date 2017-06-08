//
//  TransformLayerViewController.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/6.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TransformLayerViewController.h"

@interface TransformLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) CALayer *cube2;
@property (assign, nonatomic) CGPoint lastPoint;
@end

@implementation TransformLayerViewController

/**
 * 创建一个layer，并设置外部传入的3d变换
 */
- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //create cube face layer
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);

    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;


    face.transform = transform;
    return face;
}

/**
 *  创建CATransformLayer，并外部设置3d变换
 */
- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //create cube layer
    CATransformLayer *cube = [CATransformLayer layer];

    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //center the cube layer within the container
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);

    //apply the transform and return
    cube.transform = transform;
    return cube;
}

- (void)viewDidLoad{
    [super viewDidLoad];

    //set up the perspective transform
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    self.containerView.layer.sublayerTransform = pt;

    //set up the transform for cube 1 and add it
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.containerView.layer addSublayer:cube1];
    
    //set up the transform for cube 2 and add it
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.containerView.layer addSublayer:cube2];
    _cube2 = cube2;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];

    [self.containerView addGestureRecognizer:pan];
}


- (void)pan:(UIPanGestureRecognizer *)sender {

    if (sender.state == UIGestureRecognizerStateBegan) {
       _lastPoint = [sender locationInView:self.containerView];
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        //改变的点, 相对开始点击的点
        CGPoint translationPoint = [sender translationInView:self.containerView];
        //绝对值
        CGPoint locationPoint = [sender locationInView:self.containerView];
        NSLog(@"=====\ntranslationPoint:%@\nlocationPoint:%@",NSStringFromCGPoint(translationPoint),NSStringFromCGPoint(locationPoint));

        CGFloat angleY = (locationPoint.y - _lastPoint.y) * 0.005 * M_PI ;
        CGFloat angleX = (locationPoint.x- _lastPoint.x )* 0.005 * M_PI ;

        NSLog(@"angleX:%f---Y:%f",angleX,angleY);
        CATransform3D c2t = CATransform3DRotate(_cube2.transform, angleX, 0, 1, 0);
        _cube2.transform = CATransform3DRotate(c2t, angleY, 1, 0, 0);
        _lastPoint = locationPoint;
        //    _cube2.transform = CATransform3DIdentity;

    }



}





@end
