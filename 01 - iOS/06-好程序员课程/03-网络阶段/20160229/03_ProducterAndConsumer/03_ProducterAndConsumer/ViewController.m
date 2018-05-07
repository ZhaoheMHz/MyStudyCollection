//
//  ViewController.m
//  03_ProducterAndConsumer
//
//  Created by baoxu on 16/2/29.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//数据缓冲区
@property (strong, nonatomic) NSMutableArray *products;
//线程锁
@property (strong, nonatomic) NSCondition *condition;

/**
 *  使用NSCondition能够解决线程的生产者消费者问题
    基本思路是，首先创建NSCondition实例，然后消费者取得锁，取产品，如果没有，则wait，这时会释放锁，直到有线程唤醒它去消费，最后unlock；
    生产者制造产品，首先也是取得锁，然后生产，在发signal，这样可以唤醒wait的消费线程
    判断条件的时候使用while而不是if
 */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"开始生产者消费者模式");
    //创建一个生产者
    [NSThread detachNewThreadSelector:@selector(createProducer) toTarget:self withObject:nil];
    
    //创建三个消费者
    for (int i=0; i<3; i++) {
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(createConsuser) object:nil];
        thread.name = [NSString stringWithFormat:@"第%d个消费者",i];
        [thread start];
    }
    
}
//生产数据
-(void)createProducer{
    for (int i = 0; i<9; i++) {
//        [self.condition lock];
        //模拟生产耗时
        [NSThread sleepForTimeInterval:1.0];
        

        
        NSObject *cai = [[NSObject alloc]init];
        [self.products addObject:cai];
        NSLog(@"生产了一个菜");
        //此方法能够唤醒一个等待中的线程，如果有多个线程在等待，随机唤醒一个
        [self.condition signal];
        //此方法能唤醒所有等待的线程
//        [self.condition broadcast];
        
//        [self.condition unlock];
    }
}
//消费数据
-(void)createConsuser{
    for (int i=0; i<3; i++) {
        
        [self.condition lock];
//        [NSThread sleepForTimeInterval:1.0];

        
//        while (self.products.count == 0){
//            NSLog(@"%@等待菜\n",[NSThread currentThread].name);
            //一旦嗲用了wait方法，其他线程就可以进入“加锁代码”（注意，NSlock和synchronized不同，他们不允许进入加锁代码）
            
            //就在这里等消息，等signal或者broadcast
            [self.condition wait];
            
//        }
        
        [self.condition unlock];
        
        [self.products removeObjectAtIndex:0];
            
        NSLog(@"%@端走一个菜",[NSThread currentThread].name);

        
        
    }
}


- (NSMutableArray *)products
{
    if (!_products) {
        _products = [NSMutableArray new];
        
    }
    return _products;
}

- (NSCondition *)condition
{
    if (!_condition) {
        _condition = [NSCondition new];
    }
    return _condition;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
