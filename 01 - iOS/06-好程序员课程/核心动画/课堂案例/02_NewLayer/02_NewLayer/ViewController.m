//
//  ViewController.m
//  02_NewLayer
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/**
 创建一个新的图层对象
 */
-(void)createNewLayer{
    //新建一个图层对象
    CALayer *layer = [CALayer layer];
    /*
     //layer方法不是单例，只是一个快速创建对象的方法而已
     NSLog(@"layer:%@",layer);
     NSLog(@"layer:%@",[CALayer layer]);
     */
    layer.borderWidth = 5;
    layer.borderColor = [UIColor yellowColor].CGColor;
    //视图的layer属性是只读的，不允许直接替换
//    self.iconImageView.layer = layer;
    //添加图层对象到视图的方法
    [self.iconImageView.layer addSublayer:layer];
    //想要显示，必须给一个Frame
    layer.frame = self.iconImageView.bounds;
    
    //图层本身就可以在屏幕上显示，如果把图层内容完全填充了，就会覆盖掉原来视图上的内容
    //所以，图层经常是用来处理视图边角效果的，比如阴影，边框、圆角
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    //直接往图层上提那家内容
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"haed.jpg"].CGImage);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self createNewLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
