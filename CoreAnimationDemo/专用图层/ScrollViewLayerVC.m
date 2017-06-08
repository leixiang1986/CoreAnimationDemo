//
//  ScrollViewLayerVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/6.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ScrollViewLayerVC.h"
#import "ScrollView.h"

@interface ScrollViewLayerVC ()
@property (nonatomic, strong) ScrollView *scrollView;
@end

@implementation ScrollViewLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"640X960"];


//    CALayer *layer = [CALayer layer];
//    layer.contents = (__bridge id)image.CGImage;
//    layer.frame = CGRectMake(0, 0, image.size.width, image.size.height);


    //可以直接加view，也可以加layer
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    [self.scrollView addSubview:imageView];
}

- (ScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height - 60)];
        [self.view addSubview:_scrollView];
    }

    return _scrollView;
}




@end
