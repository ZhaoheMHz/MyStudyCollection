//
//  ViewController.m
//  贪吃蛇
//
//  Created by 赵赤赤 on 16/8/25.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "SnakeViewController.h"
#import "Masonry.h"

// 定义方向
typedef enum : NSUInteger {
    directionUp,
    directionDown,
    directionLeft,
    directionRight
} direction;

@interface SnakeViewController ()

// 记录当前方向
@property (nonatomic, assign) direction currentDirection;

// 创建蛇
@property (nonatomic, strong) NSMutableArray *snakeArr;

// 创建定时器
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *displayLink;

// 蛇运动的背景
@property (nonatomic, strong) UIView *backView;

// 记录生成的随机点
@property (nonatomic, strong) UIView *randomPoint;

@end

@implementation SnakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个画布
    self.view.frame = CGRectMake(0, 0, 300, 300);
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    self.backView = backView;
    
    
    
    /** 创建上下左右四个按钮 */
    UIView *upView = [[UIView alloc] init];
    upView.userInteractionEnabled = YES;
    [self.view addSubview:upView];
    
    UIView *downView = [[UIView alloc] init];
    downView.userInteractionEnabled = YES;
    [self.view addSubview:downView];
    
    UIView *leftView = [[UIView alloc] init];
    leftView.userInteractionEnabled = YES;
    [self.view addSubview:leftView];
    
    UIView *rightView = [[UIView alloc] init];
    rightView.userInteractionEnabled = YES;
    [self.view addSubview:rightView];
    
    // 创建手势
    UITapGestureRecognizer *tapGRUp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeDirectionUp:)];
    UITapGestureRecognizer *tapGRDown = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeDirectionDown:)];
    UITapGestureRecognizer *tapGRLeft = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeDirectionLeft:)];
    UITapGestureRecognizer *tapGRRight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeDirectionRight:)];
    [upView addGestureRecognizer:tapGRUp];
    [downView addGestureRecognizer:tapGRDown];
    [leftView addGestureRecognizer:tapGRLeft];
    [rightView addGestureRecognizer:tapGRRight];
    
    // 布局
    [upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(100);
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(0);
    }];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(100);
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(200);
    }];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(100);
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(100);
    }];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(100);
        make.left.mas_equalTo(200);
        make.top.mas_equalTo(100);
    }];
    
    
    
    // CaDisplayLink
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(forward)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    self.displayLink.frameInterval = 4;
    self.displayLink.paused = YES;
    
    [self start:nil];
}




// 重新开始
- (void)start:(id)sender {
    self.displayLink.paused = NO;
    self.snakeArr = [[NSMutableArray alloc] init];
    
    self.currentDirection = directionRight;
    
    [self.randomPoint removeFromSuperview];
    self.randomPoint = nil;
    for (UIView *view in self.backView.subviews) {
        [view removeFromSuperview];
    }
    
    // 开始游戏
    [self createUI];
}

- (void)dealloc {
    [self.displayLink invalidate];
}


- (void)createUI {
    // 创建默认五个长度的蛇
    self.snakeArr = [[NSMutableArray alloc] init];
    
    // 将蛇画到屏幕上
    for (int i=0; i<5; i++) {
        UIView *body = [[UIView alloc] init];
        body.backgroundColor = [UIColor whiteColor];
        body.frame = CGRectMake(60+i*5, 60, 5, 5);
        [self.backView addSubview:body];
        [self.snakeArr addObject:body];
    }
    
    // 生成一个随机的点
    [self addRandomPoint];
}



#pragma mark - 前进！！！
- (void)forward {
    // 根据当前方向将最后一个body移动到最前面去
    UIView *lastBody = [self.snakeArr lastObject];
    UIView *firstBody = [self.snakeArr firstObject];
    
    CGRect lastFrame = lastBody.frame;
    CGRect firstFrame = firstBody.frame;
    switch (self.currentDirection) {
        case directionUp: {
            lastFrame.origin.x = firstFrame.origin.x;
            lastFrame.origin.y = firstFrame.origin.y-5;
        }
            break;
            
        case directionDown: {
            lastFrame.origin.x = firstFrame.origin.x;
            lastFrame.origin.y = firstFrame.origin.y+5;
        }
            break;
            
        case directionLeft: {
            lastFrame.origin.y = firstFrame.origin.y;
            lastFrame.origin.x = firstFrame.origin.x-5;
        }
            break;
            
        case directionRight: {
            lastFrame.origin.y = firstFrame.origin.y;
            lastFrame.origin.x = firstFrame.origin.x+5;
        }
            break;
            
        default:
            break;
    }
    
    // 交换位置
    lastBody.frame = lastFrame;
    [self.snakeArr removeObject:lastBody];
    [self.snakeArr insertObject:lastBody atIndex:0];
    
    // 检测是否吃到了东西
    if (lastFrame.origin.x == self.randomPoint.frame.origin.x && lastFrame.origin.y == self.randomPoint.frame.origin.y) {
        // 删除并新建一个随机点
        [self.randomPoint removeFromSuperview];
        self.randomPoint = nil;
        [self addRandomPoint];
        
        // 确定蛇的尾巴的方向
        UIView *tailBody = [self.snakeArr lastObject];
        UIView *tail2Body = self.snakeArr[self.snakeArr.count-2];
        
        CGRect tailFrame;
        if (tailBody.frame.origin.x == tail2Body.frame.origin.x) {
            if (tailBody.frame.origin.y - tail2Body.frame.origin.y <0) {
                tailFrame = CGRectMake(tailBody.frame.origin.x, tailBody.frame.origin.y-5, 5, 5);
            } else {
                tailFrame = CGRectMake(tailBody.frame.origin.x, tailBody.frame.origin.y+5, 5, 5);
            }
        }
        if (tailBody.frame.origin.y == tail2Body.frame.origin.y) {
            if (tailBody.frame.origin.x - tail2Body.frame.origin.x <0) {
                tailFrame = CGRectMake(tailBody.frame.origin.x-5, tailBody.frame.origin.y, 5, 5);
            } else {
                tailFrame = CGRectMake(tailBody.frame.origin.x+5, tailBody.frame.origin.y, 5, 5);
            }
        }
        
        UIView *body = [[UIView alloc] init];
        body.backgroundColor = [UIColor whiteColor];
        body.frame = tailFrame;
        [self.backView addSubview:body];
        [self.snakeArr addObject:body];
    }
    
    
    /** 检测是否出界 */
    if (lastFrame.origin.x>300 || lastFrame.origin.x<0 || lastFrame.origin.y>300 || lastFrame.origin.y<0) {
        // 让displayLink失效
//        [self.displayLink invalidate];
//        if (self.failBlock) {
//            self.failBlock();
//        }
        [self start:nil];
    }
}

- (void)eatSomething {
    
}

- (void)addRandomPoint {
    UIView *randomPoint = [[UIView alloc] init];
    randomPoint.frame = CGRectMake((arc4random()%60)*5, (arc4random()%60)*5, 5, 5);
    
    // 检测点是否在蛇的身体中
    for (UIView *bodyView in self.snakeArr) {
        if (randomPoint.frame.origin.x == bodyView.frame.origin.x && randomPoint.frame.origin.y == bodyView.frame.origin.y) {
            [self addRandomPoint];
            return;
        }
    }
    
    randomPoint.backgroundColor = [UIColor whiteColor];
    [self.backView addSubview:randomPoint];
    self.randomPoint = randomPoint;
}


#pragma mark - 改变方向
- (void)changeDirectionUp:(UITapGestureRecognizer *)gr {
    if (self.currentDirection != directionDown) {
        self.currentDirection = directionUp;
    }
}

- (void)changeDirectionDown:(UITapGestureRecognizer *)gr {
    if (self.currentDirection != directionUp) {
        self.currentDirection = directionDown;
    }
}

- (void)changeDirectionLeft:(UITapGestureRecognizer *)gr {
    if (self.currentDirection != directionRight) {
        self.currentDirection = directionLeft;
    }
}

- (void)changeDirectionRight:(UITapGestureRecognizer *)gr {
    if (self.currentDirection != directionLeft) {
        self.currentDirection = directionRight;
    }
}
@end
