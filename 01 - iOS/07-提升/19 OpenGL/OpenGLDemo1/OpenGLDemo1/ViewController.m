//
//  ViewController.m
//  OpenGLDemo1
//
//  Created by 赵赤赤 on 16/8/29.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>

@interface ViewController ()

@property (nonatomic, strong) EAGLContext *mContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 新建上下文
    self.mContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

    GLKView *view = (GLKView *)self.view;
    view.context = self.mContext;
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    [EAGLContext setCurrentContext:self.mContext];
    
    GLfloat squareVertexData[] = {
        0.5,-0.5,0.0f,      
    };
}

@end
