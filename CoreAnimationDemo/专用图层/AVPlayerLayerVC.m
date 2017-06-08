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
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"out" withExtension:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:url];
    _player = player;
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.backgroundColor = [UIColor yellowColor].CGColor;
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];
}


- (IBAction)player:(id)sender {
    [_player play];
    if (!_player) {
        NSLog(@"没有player");
    }
}


@end
