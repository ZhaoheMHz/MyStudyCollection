//
//  videoRecorder.m
//  Demo_Video
//
//  Created by 赵赤赤 on 15/10/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "videoRecorder.h"


@implementation videoRecorder {
    BOOL isBackCaptureSupport;
    BOOL isFrontCaptureSupport;
    BOOL isTorchSupport;
    BOOL isUsingFrontCature;
}

- (instancetype)init {
    if (self = [super init]) {
        // 初始化  摄像机
        [self configRecorder];
    }
    
    return self;
}

- (void)configRecorder {
    // 1.创建session 连接输入输出通道
    // 2.获取输入设备(前后摄像头,麦克风)
    // 3.创建输入通道(视频输入通道,音频输入通道)
    // 4.创建输出通道(视频,照片)
    // 5.创建视频显示层
    // 6.设置要录制尺寸(16:9/4:3)
    // 7.启动session
    
    
// 1.创建session 连接输入输出通道
    _session = [[AVCaptureSession alloc] init];
    
// 2.获取输入设备(前后摄像头,麦克风)
    // 获取所有的设备
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    // 找到前后摄像头
    // 后置摄像头
    AVCaptureDevice *backCapture = nil;
    // 前置摄像头
    AVCaptureDevice *frontCapture = nil;
    // 根据位置来分辨前后摄像头
    for (AVCaptureDevice *device in devices) {
        if (device.position == AVCaptureDevicePositionBack) {
            backCapture = device;
        }
        if (device.position == AVCaptureDevicePositionFront) {
            frontCapture = device;
        }
    }
    
    // 设置
    [backCapture lockForConfiguration:nil];
    // 设置曝光
    if ([backCapture isExposureModeSupported:AVCaptureExposureModeAutoExpose]) {
        [backCapture setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
    }
    [backCapture unlockForConfiguration];
    
    // 记录后置摄像头是否存在
    if (backCapture) {
        isBackCaptureSupport = YES;
        
        // 判断是否支持闪光灯
        if ([backCapture hasTorch]) {
            isTorchSupport = YES;
        } else {
            isTorchSupport = NO;
        }
    } else {
        isBackCaptureSupport = NO;
    }
    
    // 记录前置摄像头是否存在
    if (frontCapture) {
        isFrontCaptureSupport = YES;
    } else {
        isFrontCaptureSupport = NO;
    }
    
// 3.创建输入通道(视频输入通道,音频输入通道)
    // 视频输入通道
    _videoInput = [AVCaptureDeviceInput deviceInputWithDevice:backCapture error:nil];
    // 音频输入通道
    _audioInput = [AVCaptureDeviceInput deviceInputWithDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio] error:nil];
    
    // 将session和输入通道连接起来
    [_session addInput:_videoInput];
    [_session addInput:_audioInput];
    
// 4.创建输出通道(视频,照片)
    _videoOutput = [[AVCaptureMovieFileOutput alloc] init];
    // 将输出通道跟session连接起来
    [_session addOutput:_videoOutput];

// 5.创建视频显示层
    _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
// 6.设置要录制尺寸(16:9/4:3)
    _session.sessionPreset = AVCaptureSessionPresetHigh;
    
// 7.拍照功能
    // 创建拍照的输出,将拍照的输出通道与session连接起来
    _stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    // 判断是否支持照片输出通道
    if ([_session canAddOutput:_stillImageOutput]) {
        [_stillImageOutput setOutputSettings:@{AVVideoCodecKey: AVVideoCodecJPEG}];
        [_session addOutput:_stillImageOutput];
    }
    
// 8.启动session
    [_session startRunning];
}


// 录制视频
- (void)startRecordingWithUrl:(NSURL *)url {
    [_videoOutput startRecordingToOutputFileURL:url recordingDelegate:self];
}

// 停止录制
- (void)stopRecording {
    [_videoOutput stopRecording];
}

// 实现拍照功能
- (void)takePhoto {
    // 1.设置拍照的方向
    [[_stillImageOutput connectionWithMediaType:AVMediaTypeVideo] setVideoOrientation:AVCaptureVideoOrientationPortrait];
    
    // 2.将照片数据从缓冲区取出
    [_stillImageOutput captureStillImageAsynchronouslyFromConnection:[_stillImageOutput connectionWithMediaType:AVMediaTypeVideo] completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            
            NSLog(@"imageData %@", imageData);
            
            // 讲nsdata变成uiimage
            UIImage *image = [UIImage imageWithData:imageData];
            // 将照片保存到系统相册
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        }
    }];
}

// 闪光灯操作
- (void)torchOpe:(BOOL)open {
    // 判断是否支持闪光灯,如果支持,继续操作,如果不支持,程序结束
    if (!isTorchSupport) {
        return;
    }
    
    // 根据open   判断闪光灯的开关模式
    AVCaptureTorchMode mode;
    if (open) {
        // 打开闪光灯
        NSLog(@"打开闪光灯");
        mode = AVCaptureTorchModeOn;
    } else {
        // 关闭闪光灯
        NSLog(@"关闭闪光灯");
        mode = AVCaptureTorchModeOff;
    }
    
    // 取到当前设备 开启或关闭闪光灯,重新设置聚焦曝光模式
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AVCaptureDevice *currentDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        [currentDevice lockForConfiguration:nil];
        [currentDevice setTorchMode:mode];
        
        [currentDevice unlockForConfiguration];
    });
}

// 前后摄像头的转换
- (void)switchCamera {
    // 1.如果只有一个摄像头,不允许切换
    if (!isBackCaptureSupport || !isFrontCaptureSupport || _videoInput) {
        return;
    }
    
    isUsingFrontCature = !isUsingFrontCature;
    
    // 2.重新配置session:移除现有的输入通道,取到目标设备,用目标设备重置输入通道,重新将配置好的输入通道加入session
    // session的配置
    [_session beginConfiguration];
    // 移除现有输入通道
    [_session removeInput:_videoInput];
    // 取到目标设备
    AVCaptureDevice *expectDevice = nil;
    expectDevice = [self getExpectDevice:isUsingFrontCature];
    // 重新设置设备的聚焦和曝光
    [expectDevice lockForConfiguration:nil];
    if ([expectDevice isExposureModeSupported:AVCaptureExposureModeAutoExpose]) {
        [expectDevice setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
    }
    [expectDevice unlockForConfiguration];
    // 重新配置输入通道
    _videoInput = [AVCaptureDeviceInput deviceInputWithDevice:expectDevice error:nil];
    // 将已移除的输入通道添加回去
    [_session addInput:_videoInput];
    
    // 3.session配置完成
    [_session commitConfiguration];
}

// 取设备
- (AVCaptureDevice *)getExpectDevice:(BOOL)isFront {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    for (AVCaptureDevice *device in devices) {
        if (isFront) {
            // 得到前置摄像头
            if (device.position == AVCaptureDevicePositionFront) {
                return device;
            }
        } else {
            // 得到后置摄像头
            if (device.position == AVCaptureDevicePositionBack) {
                return device;
            }
        }
    }
    
    return nil;
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error {
    NSLog(@"录制完成");
    if (_delegate && [_delegate respondsToSelector:@selector(recorderFinish:)]) {
        [_delegate recorderFinish:outputFileURL];
    }
}




@end
