//
//  AVPlayerLayer.m
//  CoreAnimationDemo
//
//  Created by 雷祥 on 2017/6/7.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "AVPlayerLayerVC.h"
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerLayerVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) AVPlayer *player;
@end

@implementation AVPlayerLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"out" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    _player = player;
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];

    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
    playerLayer.transform = transform;

    playerLayer.backgroundColor = [UIColor yellowColor].CGColor;
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];

}


- (void)playFinished:(id)notify {
    NSLog(@"播放完成:%@",notify);
    [self.navigationItem.rightBarButtonItem setTitle:@"播放"];

}


- (IBAction)player:(id)sender {
    UIBarButtonItem *item = sender;
    NSLog(@"===%ld",_player.status);
    NSLog(@"item:%@",_player.currentItem);

    if ([item.title isEqualToString:@"播放"]) {
        [_player play];
        if (!_player) {
            NSLog(@"没有player");
        }
        [item setTitle:@"暂停"];
    }
    else {
        [_player pause];
        [item setTitle:@"播放"];
    }

}





@end
