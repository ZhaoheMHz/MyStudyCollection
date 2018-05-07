//
//  ViewController.m
//  01_LayerBasic
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
/**
 *  一、什么是图层类？
    1.核心动画的所有效果都是基于图层的，没有图层就没有动画效果
    2.视图为什么能显示到屏幕上，是因为有layer存在
        a.调用drawRect方法，显示出绘制的东西
        b.在显示图形前会创建一个图层对象（CALayer）,然后把需要绘制的东西放在图层上，呈献给用户看
        c.没有图层，就没有显示功能，就是说没有界面
    3.图层能够用来做什么？
      使用图层用来操作视图的外观属性，也是学习图层的目的
        a.阴影效果
        b.边框效果
        c.圆角效果
        d.更强大的动画效果
 
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self testLayer];
//    [self testImageLayer];
    [self testImageLayerTransform];
}

/**
 *  3.Layer的旋转，平移，缩放
 */
-(void)testImageLayerTransform{
    //1.回想一下以前的形变方法
    //最后设置的transform值才会起作用
//    //旋转（pi/4）
//    self.iconImageView.transform = CGAffineTransformMakeRotation(M_PI/4);
//    //平移(向下，向右)
//    self.iconImageView.transform = CGAffineTransformMakeTranslation(100, 100);
//    //缩放(x*比例，y*比例)
//    self.iconImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    
    //图层的形变属性
    //缩放(x、y、z三个维度的比例，因为我们是iOS平面的，所以z轴比例给任意值都可以，给0就行)
    self.iconImageView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0);
    //平移
    self.iconImageView.layer.transform = CATransform3DMakeTranslation(100, 100, -100);
    
    //旋转
    /**
     *  3D旋转
     *
     *  @param angle#> 旋转角度 description#>
        3维空间内x、y、z确定一个点，原点和这个点确定一条线（向量），这条线就是旋转的轴（即旋转方向垂直于这个轴，向量）
     
     *  @param x#>     轴向量的x坐标 description#>
     *  @param y#>     轴向量的y坐标 description#>
     *  @param z#>     轴向量的z坐标 description#>
     *
     *  @return 旋转图形
     */
    //ps:要实现xy平面的旋转，只要沿着z轴设置就可以（0，0，1~）;要想学好三维效果，需要有专业的知识，比如游戏开发，我们作为平面开发人员，了解就好
    self.iconImageView.layer.transform = CATransform3DMakeRotation(M_PI/4, 0,0, 100);
    
}

/**
 *  2.ImageViewLayer的基本操作
 */
-(void)testImageLayer{
    self.iconImageView.layer.borderWidth = 2;
    self.iconImageView.layer.borderColor = [UIColor purpleColor].CGColor;
    self.iconImageView.layer.cornerRadius = 50;
    
    //设置阴影
    self.iconImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.iconImageView.layer.shadowOffset = CGSizeMake(20, 20);
    self.iconImageView.layer.shadowOpacity = 0.5;
    
    
    //超出边框的内容需要裁掉，将masksToBounds属性设置为YES!(注意，阴影也会被裁剪掉，因为阴影肯定在边框外)
    self.iconImageView.layer.masksToBounds = YES;
    
}
/**
 *  1.CALayer的基本操作
 */
-(void)testLayer{

    //获取图层对象
    CALayer *layer = self.colorView.layer;
    
    //做图层的基本操作
//    1.设置边框宽度
    layer.borderWidth = 5;
//    2.设置边框颜色
    layer.borderColor = [UIColor blueColor].CGColor;
//    3.设置圆角边框
    layer.cornerRadius = 10;
    //如果是正方形，可以使用宽度的一半作为圆角半径，实现切圆
    layer.cornerRadius = self.colorView.bounds.size.width/2;
    
//    4.设置阴影
    //设置阴影的偏移量
    layer.shadowOffset = CGSizeMake(20, 20);
    //设置阴影的颜色
    layer.shadowColor = [UIColor yellowColor].CGColor;
    //需要给一个透明度，默认是全透明的，看不见
    layer.shadowOpacity = 0.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
