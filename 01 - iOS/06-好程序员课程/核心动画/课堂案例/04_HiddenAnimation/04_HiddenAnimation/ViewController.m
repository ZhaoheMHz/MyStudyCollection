//
//  ViewController.m
//  04_HiddenAnimation
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) CALayer *layer;

@end
/*
     1.根层
     所有的视图,默认情况下都有一个layer层对象,这个层就是根层
     通过addSubLayer添加的层都是子层
     
     2.隐式动画都是相对于子层来说的
     当修改了某个子层的属性的时候,会默认产生动画效果,就是所谓的隐式动画
     
     3.修改哪些属性会产生隐式动画效果
        1.Frame  缩放动画
        2.backgroundColor 会产生颜色渐变动画
     
     4.关闭隐式动画
        CATransaction 是layer内部设置隐士动画的开关
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    self.layer = layer;
    
    [self.view.layer addSublayer:self.layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //关闭隐式动画
//    [CATransaction setDisableActions:YES];
    //修改动画执行时间
    [CATransaction setAnimationDuration:4.0];
    //1.改变frame
    self.layer.frame = self.view.bounds;
    //2.改变图层颜色
    self.layer.backgroundColor = [UIColor yellowColor].CGColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
