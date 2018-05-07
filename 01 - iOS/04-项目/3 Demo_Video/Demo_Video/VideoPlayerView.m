//
//  VideoPlayerView.m
//  Demo_Video
//
//  Created by 赵赤赤 on 15/10/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "VideoPlayerView.h"

@implementation VideoPlayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)thePlayer {
    return [(AVPlayerLayer *)[self layer] setPlayer:thePlayer];
}

@end
