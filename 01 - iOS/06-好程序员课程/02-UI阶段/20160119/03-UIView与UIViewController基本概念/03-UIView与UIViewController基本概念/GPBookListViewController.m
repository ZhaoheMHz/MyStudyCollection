//
//  GPBookListViewController.m
//  03-UIView与UIViewController基本概念
//
//  Created by 哲 肖 on 16/1/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPBookListViewController.h"

@interface GPBookListViewController ()

@end

@implementation GPBookListViewController

//只要默认视图创建完成,就会自动的调用viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
//    self.view.backgroundColor = [UIColor yellowColor];
    
    CGFloat bookViewW = 100;
    CGFloat bookViewH = 140;
    //屏幕的宽度 - 一个小块的宽度 * 总的列数 / 总的列数 + 1
    int totalColum = 3;
    int totalRow = 4;
    
    CGFloat marginX = (self.view.frame.size.width - bookViewW * totalColum) / (totalColum + 1);
    CGFloat marginY = (self.view.frame.size.height - bookViewH * totalRow) / (totalRow + 1);
    NSLog(@"mX %f,mY %f",marginX,marginY);
    
    for(int i = 0; i < 12; i++){
        //1.创建一个视图作为容器
        UIView * bookView = [[UIView alloc] init];
        //2.建立父子关系,如果一个视图想要正确的显示在界面上,只要与一个已经显示在页面的视图建立父子关系就可以
        //与控制器管理的默认视图,建立父子关系
        [self.view addSubview:bookView];
        
        //计算当前i 值所处在的列
        CGFloat currentColum = i % totalColum;// 0 - 2
        //计算当前i 值所处在的行
        CGFloat currentRow = i / totalColum;//0 - 3;
        
        CGFloat bookViewX = marginX + (marginX + bookViewW) * currentColum;
        CGFloat bookViewY = marginY + (marginY + bookViewH)  * currentRow;
        //3.设置正确的Frame
        bookView.frame = CGRectMake(bookViewX, bookViewY, bookViewW, bookViewH);
//        bookView.backgroundColor = [UIColor redColor];
        
        
        //1.用来显示书本图片的
        UIButton * bookImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //2.建立父子关系
        [bookView addSubview:bookImageButton];
        //3.设置正确的Frame
        CGFloat imageButtonX = (bookViewW - 80) * 0.5;
        bookImageButton.frame = CGRectMake(imageButtonX, 0, 80, 100);
        //设置背景图片
        [bookImageButton setBackgroundImage:[UIImage imageNamed:@"A9781430233305-small"] forState:UIControlStateNormal];
        
        UILabel * bookNameLabel = [[UILabel alloc] init];
        [bookView addSubview:bookNameLabel];
        CGFloat bookNameLabelX = 0;
        CGFloat bookNameLabelY = bookImageButton.frame.size.height + bookImageButton.frame.origin.y;
        CGFloat bookNameLabelW = bookView.frame.size.width;
        CGFloat bookNameLabelH = 20;

        bookNameLabel.frame = CGRectMake(bookNameLabelX,bookNameLabelY  , bookNameLabelW,bookNameLabelH);
        bookNameLabel.text = @"test";
        bookNameLabel.textAlignment = NSTextAlignmentCenter;
        
        
        UIButton * downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bookView addSubview:downLoadButton];
        CGFloat downLoadButtonX = 0;
        CGFloat downLoadButtonY = bookNameLabelH + bookNameLabelY;
        CGFloat downLoadButtonW = bookView.frame.size.width;
        CGFloat downLoadButtonH = 20;
        
        downLoadButton.frame = CGRectMake(downLoadButtonX, downLoadButtonY, downLoadButtonW, downLoadButtonH);
        [downLoadButton setTitle:@"下载" forState:UIControlStateNormal];
        downLoadButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [downLoadButton setBackgroundImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];
        
//        bookImageButton.backgroundColor = [UIColor greenColor];
        
    }//end for
    
}//end viewDidLoad


@end
