//
//  ReflectionViewVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/7.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ReflectionViewVC.h"
#import "ReflectionView.h"

//反射
@interface ReflectionViewVC ()
@property (weak, nonatomic) IBOutlet ReflectionView *reflectionView;

@end

@implementation ReflectionViewVC

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        //注意反射的layer是以下边缘为对称轴,可以加view也可以是layer
        UIImage *image = [UIImage imageNamed:@"1242x2208"];
        UIImageView *imageVIew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.reflectionView.frame.size.width, self.reflectionView.frame.size.height * 1)];
        imageVIew.image = image;
        [self.reflectionView addSubview:imageVIew];
        //也可以添加layer
    //    CALayer *layer = [CALayer layer];
    //    layer.contents = (__bridge id)image.CGImage;
    //    layer.frame = self.reflectionView.bounds;
    //    [self.reflectionView.layer addSublayer:layer];
    }



@end
