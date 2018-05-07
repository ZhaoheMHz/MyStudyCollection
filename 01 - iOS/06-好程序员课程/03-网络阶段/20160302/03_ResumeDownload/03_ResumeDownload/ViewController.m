//
//  ViewController.m
//  03_ResumeDownload
//
//  Created by baoxu on 16/3/2.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "ResumeDownload.h"

@interface ViewController ()
{
    ResumeDownload *_resume;
    float _pv;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView.hidden = YES;
    
}

- (IBAction)btnStart:(id)sender {
    
    NSString *url = @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    _resume = [[ResumeDownload alloc]init];
    _resume.fileUrl = url;
    
    _resume.delegate = self;
    _resume.updatingMethod = @selector(upading:);
    _resume.finishMethod = @selector(finishDownload:);
    _resume.failMethod = @selector(failDownload:);
    
    //开始下载
    [_resume requestFromUrl];
    self.progressView.hidden = NO;

}
//下载进度
-(void)upading:(ResumeDownload*)rd{
    
    _pv = [rd.downloadSize floatValue]/[rd.fileSize floatValue];
    
    self.progressView.progress = _pv;
}

//下载完成
-(void)finishDownload:(ResumeDownload*)rd{
    self.progressView.hidden = YES;
    if ([rd localPath]) {
        self.imageView.image = [UIImage imageWithContentsOfFile:[rd localPath]];
    }

}
//下载失败
-(void)failDownload:(ResumeDownload*)rd{
    NSLog(@"下载失败:%@",[rd localPath]);
}

- (IBAction)btnCancel:(id)sender {
    if (_resume) {
        [_resume stopDownload];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
