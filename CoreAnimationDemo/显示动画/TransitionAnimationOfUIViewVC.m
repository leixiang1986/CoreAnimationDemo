//
//  TransitionAnimationOfUIViewVC.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/14.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "TransitionAnimationOfUIViewVC.h"

@interface TransitionAnimationOfUIViewVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSArray *images;
@end

@implementation TransitionAnimationOfUIViewVC

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
    [UIView transitionWithView:self.imageView duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        //cycle to next image
                        UIImage *currentImage = self.imageView.image;
                        NSUInteger index = [self.images indexOfObject:currentImage];
                        index = (index + 1) % [self.images count];
                        self.imageView.image = self.images[index];
                    }
                    completion:NULL];
}


@end
