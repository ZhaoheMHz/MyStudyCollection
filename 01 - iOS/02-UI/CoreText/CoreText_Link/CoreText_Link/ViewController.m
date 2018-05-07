//
//  ViewController.m
//  CoreText_Link
//
//  Created by baoxu on 16/3/12.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITextView *_textView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width-20, self.view.bounds.size.height-200)];
    
    _textView.backgroundColor = [UIColor colorWithRed:0.9115 green:0.9115 blue:0.9115 alpha:1.0];
    [self.view addSubview:_textView];
    
    [self createAttributeString];

}

#pragma mark -CoreText-

-(void)createAttributeString{
    //创建一个带属性的字符串
    NSAttributedString *atdStr = [[NSAttributedString alloc]initWithString:@"百度一下百度一下百度一下"];
    
    //设置属性
    //背景色
    UIColor *backColor = [UIColor yellowColor];
    //文字的颜色
    UIColor *foregColor = [UIColor redColor];
    
    //行距
    NSNumber *lineOffset = @(10.0);
    //文字的间隔
    NSNumber *kern = @(20);
    
    //下划线
    NSNumber *underLine = @(NSUnderlineStyleSingle);
    
    //字体
    UIFont *font = [UIFont systemFontOfSize:30];
    
    //连写
    NSNumber *ligature = @(10);
    
    //超链接
    NSURL *linkUrl = [NSURL URLWithString:@"http://www.baidu.com"];
    
    //集成到字典里面
    NSDictionary *atbDict = @{
        NSBackgroundColorAttributeName : backColor,
        NSForegroundColorAttributeName : foregColor,
        NSBaselineOffsetAttributeName : lineOffset,
        NSKernAttributeName : kern,
        NSUnderlineStyleAttributeName : underLine,
        NSFontAttributeName : font,
        NSLigatureAttributeName : ligature,
        NSLinkAttributeName : linkUrl
                              };
    
    //使用可变富文本设置属性
    NSMutableAttributedString *mabtStr = [[NSMutableAttributedString alloc]initWithAttributedString:atdStr];
    [mabtStr beginEditing];
    
    [mabtStr addAttributes:atbDict range:NSMakeRange(0, mabtStr.length)];
    
    [mabtStr endEditing];
    
    
    //展示到textView上
    _textView.attributedText = mabtStr;
    
    _textView.editable = NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
