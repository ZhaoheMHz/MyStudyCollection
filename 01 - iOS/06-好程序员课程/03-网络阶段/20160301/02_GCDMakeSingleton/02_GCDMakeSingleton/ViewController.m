//
//  ViewController.m
//  02_GCDMakeSingleton
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "Banzhang.h"

@interface ViewController ()
@property (copy, nonatomic) NSString *str;
@end

/**
 *  iOS当中如何实现一个真正的单例
    1.首先要保证allocWithZone是线程安全的，当调用super方法的时候使用dispatch_once方法锁住
    2.还要保证单例方法中也使用了dispatch_once方法锁住创建对象的过程
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [self oldProblem];
    [self newSingleton];
}

-(void)newSingleton{
    
//    NSLog(@"1:%@",[Banzhang getBanzhang]);
//
//    NSLog(@"2:%@",[[Banzhang alloc]init]);
//
//    NSLog(@"3:%@",[[[Banzhang alloc]init] copy]);
    
    dispatch_async(dispatch_get_global_queue(2, 0), ^{
        NSLog(@"%@",[[Banzhang alloc]init]);
        [[Banzhang alloc]init].name = @"王失聪";
        NSLog(@"%@",[[Banzhang alloc]init].name);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        Banzhang *banzhang = [[Banzhang alloc]init];
        banzhang.name = @"王失明";
        
        NSLog(@"1%@",banzhang);
        
        NSLog(@"2%@",[Banzhang new]);
        
        NSLog(@"3%@",[banzhang copy]);
        
        NSLog(@"4%@",banzhang.name);
        
        NSLog(@"5%@",[Banzhang new].name);
        
        
    });

}

//单例可能存在的问题
-(void)oldProblem{
    //单例模式，模仿系统的方法实现单例
    NSFileManager *fmg = [NSFileManager defaultManager];
    //获取一个看看
    NSLog(@"%@",fmg);
    NSLog(@"%@",[NSFileManager defaultManager]);
    //创建一个
    NSLog(@"%@",[[NSFileManager alloc]init]);
    //发现地址不一样了，也就证明不是同一个实体，不是真正意义的单例
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
