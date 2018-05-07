//
//  ViewController.m
//  Demo_Video
//
//  Created by 赵赤赤 on 15/10/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "videoRecorder.h"
#import "CropViewController.h"

@interface ViewController () <videoRecorderDelegate>

@end

@implementation ViewController {
    videoRecorder *_recorder;
    BOOL _isRecording;
    BOOL _openTorch;
    NSURL *_videoUrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configRecorder];
}

// 设置recorder
- (void)configRecorder {
    _recorder = [[videoRecorder alloc] init];
    _recorder.delegate = self;
    
    UIView *preView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    [self.view addSubview:preView];
    
    _recorder.previewLayer.frame = preView.bounds;
    
    [preView.layer addSublayer:_recorder.previewLayer];
}

// 录制视频
- (IBAction)recordAction:(id)sender {
    if (!_isRecording) {
        NSLog(@"开始录制");
        NSDate *date = [NSDate date];
        // 时间字符串
        NSString *currentTime = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
        
        // 视频名称
        NSString *videoName = [[self videoPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4", currentTime]];
        
        // 开始录制
        [_recorder startRecordingWithUrl:[NSURL URLWithString:videoName]];
    } else {
        NSLog(@"结束录制");
        
        // 结束录制
        [_recorder stopRecording];
    }
    
    _isRecording = !_isRecording;
}

- (NSString *)videoPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = paths[0];
    NSString *videoPath = [path stringByAppendingPathComponent:@"videos"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:videoPath]) {
        return videoPath;
    } else {
        if ([fm createDirectoryAtPath:videoPath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"创建文件夹成功");
            return videoPath;
        } else {
            NSLog(@"创建文件夹失败");
        }
    }
    
    return nil;
}

// 拍照
- (IBAction)takePhotoAction:(id)sender {
    [_recorder takePhoto];
}

// 闪光灯操作
- (IBAction)torchAction:(id)sender {
    _openTorch = !_openTorch;
    [_recorder torchOpe:_openTorch];
}

// 切换摄像头
- (IBAction)switchCameraAction:(id)sender {
    [_recorder switchCamera];
}

- (IBAction)finishAction:(id)sender {
    CropViewController *cvc = [[CropViewController alloc] init];
    cvc.videoUrl = _videoUrl;
    [self presentViewController:cvc animated:YES completion:nil];
}


#pragma mark - 实现代理方法
- (void)recorderFinish:(NSURL *)url {
    _videoUrl = url;
}

@end
