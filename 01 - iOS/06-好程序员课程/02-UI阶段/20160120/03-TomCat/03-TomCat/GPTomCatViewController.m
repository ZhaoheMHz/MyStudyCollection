//
//  GPTomCatViewController.m
//  03-TomCat
//
//  Created by 哲 肖 on 16/1/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTomCatViewController.h"

@interface GPTomCatViewController ()

@property (nonatomic, weak)UIImageView * imageView;

@end

@implementation GPTomCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    //bounds = {0,0,w,h}
    
    //UIImageView组件专门用来显示图片内容的
    UIImageView * imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    imageView.frame = self.view.bounds;
    
    //如果要加载jpg图片,要加上尾缀
    imageView.image = [UIImage imageNamed:@"angry_00.jpg"];
//    imageView.backgroundColor = [UIColor redColor];
    self.imageView = imageView;
    
    UIButton * angryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:angryButton];
    angryButton.frame = CGRectMake(100, 100, 200, 200);
//    angryButton.backgroundColor = [UIColor yellowColor];
    [angryButton addTarget:self action:@selector(angryButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * drinkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:drinkButton];
    drinkButton.frame = CGRectMake(100, 350, 200, 200);
    [drinkButton addTarget:self action:@selector(drinkButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:clearButton];
    clearButton.frame = CGRectMake(0, 0, 100, 100);
    clearButton.backgroundColor = [UIColor greenColor];
    [clearButton addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)angryButtonTouch
{
    [self animationWithImageName:@"angry" count:26];
}

- (void)drinkButtonTouch
{
    [self animationWithImageName:@"drink" count:81];
}
- (void)animationWithImageName:(NSString *)imageName count:(NSInteger)count
{
    
    //阻止动画被中断
    if(self.imageView.isAnimating) return;
    
    //1.把所有动画执行的图片加载到内存中
    NSMutableArray * angryArray = [NSMutableArray array];
    for(int i = 0; i < count;i++)
    {
        NSString * name = [NSString stringWithFormat:@"%@_%02d.jpg",imageName,i];
        
        //pathForResource 可以直接使用有尾缀的资源名称,这样后面type给nil就可以
        NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        //使用imageWithContentsOfFile 方式加载的图片,不会被缓存下来,我们可以正常的释放掉它
        //ARC下面,有没有内存泄露
        //有: 图片数组 imageName方式加载的数据
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        [angryArray addObject:image];
        
        /*
        //angry_18.jpg
        NSString * name = [NSString stringWithFormat:@"%@_%02d.jpg",imageName,i];
        //如果我们使用imageNamed方式加载图片,默认会把加载的图片在内存中始终缓存下来,方便下次加载的时候速度更快
        //如果有很多很大的图片都是用了imageNamed方式加载会使得内存飙升
        //所有加载大图片的时候不建议使用
        UIImage * image = [UIImage imageNamed:name];
        [angryArray addObject:image];
         */
        
    }
    //2.把图片数组赋值给一个ImageView对象
    self.imageView.animationImages = angryArray;
    //动画重复执行的次数
    self.imageView.animationRepeatCount = 1;
    //预估每一张图片的显示时间0.05
    self.imageView.animationDuration = angryArray.count * 0.05;
    //3.执行动画
    [self.imageView startAnimating];
}

- (void)clear
{
    NSLog(@"清空了");
    self.imageView.animationImages = nil;
}



@end
