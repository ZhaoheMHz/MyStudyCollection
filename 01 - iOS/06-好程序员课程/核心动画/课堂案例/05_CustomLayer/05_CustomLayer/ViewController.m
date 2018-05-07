//
//  ViewController.m
//  05_CustomLayer
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayer.h"

@interface ViewController ()

@end
/**
 *  自定义图层，就是创建一个类继承自CALayer
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomLayer *layer = [CustomLayer layer];
    
    [self.view.layer addSublayer:layer];
    
    layer.frame = self.view.bounds;
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    //需要显示自定义的layer，调用setNeedsDisplay方法才回执行drawInContext，否则不会自动调用
    [layer setNeedsDisplay];
    
    //layer是可以设置代理的，
    //当我们不想重写drawInContext方法的时候，可以通过代理来实现相应的功能，代理方法是drawLayer:inContext:
    layer.delegate = self;
}
//设置layer的代理方法
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 100, 100));
    CGContextFillPath(ctx);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
