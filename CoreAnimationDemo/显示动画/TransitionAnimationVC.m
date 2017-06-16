//
//  TransitionAnimationVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/13.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TransitionAnimationVC.h"

@interface TransitionAnimationVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSArray *images;
@end

@implementation TransitionAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView.image = [UIImage imageNamed:@"1242x2208_00_00.png"];
}

- (NSArray *)images {
    if (!_images) {
        _images = @[[UIImage imageNamed:@"1242x2208_00_00.png"],
                    [UIImage imageNamed:@"1242x2208_00_01.png"],
                    [UIImage imageNamed:@"1242x2208_00_07.png"],
                    [UIImage imageNamed:@"1242x2208_00_08.png"]];
    }

    return _images;
}

- (IBAction)switchImage
{
    //set up crossfade transition
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromTop;
    transition.startProgress = 0.0;
    transition.endProgress = 1.0;
    //apply transition to imageview backing layer
    [self.imageView.layer addAnimation:transition forKey:nil];
    //cycle to next image
    UIImage *currentImage = self.imageView.image;
    NSUInteger index = [self.images indexOfObject:currentImage];
    index = (index + 1) % [self.images count];
    self.imageView.image = self.images[index];
}





@end
