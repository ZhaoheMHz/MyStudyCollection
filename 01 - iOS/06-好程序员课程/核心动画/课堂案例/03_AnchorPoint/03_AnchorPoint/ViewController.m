//
//  ViewController.m
//  03_AnchorPoint
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *clearView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
//位置和锚点演示
-(void)testPositionAndAnchorPoint{
    CALayer *layer = [CALayer layer];
    
    [self.clearView.layer addSublayer:layer];
    
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    
    layer.frame = self.clearView.bounds;
    
    NSLog(@"clearView.frame:%@",NSStringFromCGRect(self.clearView.frame));
    NSLog(@"layer.frame:%@",NSStringFromCGRect(layer.frame));
    
    //如果改变layer.frame 会怎样？
    layer.frame = CGRectMake(50, 50, 100, 100);
    
    NSLog(@"clearView.frame:%@",NSStringFromCGRect(self.clearView.frame));
    NSLog(@"layer.frame:%@",NSStringFromCGRect(layer.frame));
    
    self.clearView.backgroundColor = [UIColor redColor];
    //改动layer的frame，并不会改变视图的frame，只不过是图层必须依赖某个具体的视图而存在
    /**
     * (1)、position和anchorPoint
         CALayer有2个非常重要的属性：position和anchorPoint
         @property CGPoint position;
         用来设置CALayer在父层中的位置
         以父层的左上角为原点(0, 0)
          
         @property CGPoint anchorPoint;
         称为“定位点”、“锚点”
         决定着CALayer身上的哪个点会在position属性所指的位置
         以自己的左上角为原点(0, 0)
         它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
     */
    
    layer.position = CGPointMake(100, 100);
    layer.position = CGPointMake(120, 120);
    
    NSLog(@"clearView.frame:%@",NSStringFromCGRect(self.clearView.frame));
    NSLog(@"layer.frame:%@",NSStringFromCGRect(layer.frame));
    
    layer.anchorPoint = CGPointMake(0, 0);
    layer.anchorPoint = CGPointMake(0, 0.5);
    layer.anchorPoint = CGPointMake(1, 1);
    
    NSLog(@"clearView.frame:%@",NSStringFromCGRect(self.clearView.frame));
    NSLog(@"layer.frame:%@",NSStringFromCGRect(layer.frame));
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testPositionAndAnchorPoint];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
