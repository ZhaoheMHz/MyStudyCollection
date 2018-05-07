//
//  CropViewController.m
//  Demo_Video
//
//  Created by 赵赤赤 on 15/10/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "CropViewController.h"
#import "VideoPlayerView.h"

@interface CropViewController () {
    VideoPlayerView *videoPlayer;
    BOOL isPlaying;
}

@end

@implementation CropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configVideoPlayer];
    [self configControlBtn];
}

- (void)configVideoPlayer {
    videoPlayer = [[VideoPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    // 设置acasset
    AVAsset *asset = [AVAsset assetWithURL:_videoUrl];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithAsset:asset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    [videoPlayer setPlayer:player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoPlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    [self.view addSubview:videoPlayer];
}

// 播放结束通知方法
- (void)videoPlayEnd {
    NSLog(@"播放结束了");
    [videoPlayer.player pause];
    isPlaying = NO;
    // 将播放时间设置为最初始状态
    [videoPlayer.player seekToTime:CMTimeMake(0, 1)];
}

- (void)configControlBtn {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"播放" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 400, 50, 50);
    [button addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"压缩" forState:UIControlStateNormal];
    button1.frame = CGRectMake(230, 400, 50, 50);
    [button1 addTarget:self action:@selector(cropAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)playAction:(UIButton *)button {
    if (!isPlaying) {
        NSLog(@"播放");
        [videoPlayer.player play];
    } else {
        NSLog(@"暂停");
        [videoPlayer.player pause];
    }
    
    isPlaying = !isPlaying;
}

- (void)cropAction:(UIButton *)button {
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
