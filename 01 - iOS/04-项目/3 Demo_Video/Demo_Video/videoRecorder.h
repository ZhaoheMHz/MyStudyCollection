//
//  videoRecorder.h
//  Demo_Video
//
//  Created by 赵赤赤 on 15/10/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@protocol videoRecorderDelegate <NSObject>
- (void)recorderFinish:(NSURL *)url;
@end

@interface videoRecorder : NSObject <AVCaptureFileOutputRecordingDelegate>

@property (nonatomic, strong) AVCaptureSession *session;

// 创建视频输入通道
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;
// 创建音频输入通道
@property (nonatomic, strong) AVCaptureDeviceInput *audioInput;

// 创建视频输出通道
@property (nonatomic, strong) AVCaptureMovieFileOutput *videoOutput;

// 创建视频显示层
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

// 创建拍照的输出通道
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

@property (nonatomic, assign) id<videoRecorderDelegate> delegate;

// 录制视频
- (void)startRecordingWithUrl:(NSURL *)url;

// 停止录制
- (void)stopRecording;

// 实现拍照功能
- (void)takePhoto;

// 闪光灯操作
- (void)torchOpe:(BOOL)open;

// 前后摄像头的转换
- (void)switchCamera;

@end