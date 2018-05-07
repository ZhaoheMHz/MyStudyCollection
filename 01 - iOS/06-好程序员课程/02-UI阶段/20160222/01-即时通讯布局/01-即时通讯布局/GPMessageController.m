//
//  GPMessageController.m
//  01-即时通讯布局
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPMessageController.h"
#import "GPMessage.h"
#import "GPMessageCell.h"

@interface GPMessageController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,copy)NSArray * messageArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GPMessageController

- (NSArray *)messageArray
{
    if(_messageArray == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * dict in dictArray)
        {
            GPMessage * message = [GPMessage messageWithDict:dict];
            [objs addObject:message];
        }
        
        _messageArray = objs;
        
    }
    
    return _messageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tableView加载出来,直接定位到最后一行数据上
    [self scrollToBottom];
    
   //addObserver: 谁想要知道 键盘弹出来了
   //selector : 键盘弹出来之后,要做什么操作(调用那个方法)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

- (void)keyboardChange:(NSNotification * )sender
{
    NSDictionary * userInfo =  sender.userInfo;
    
    //键盘弹出来的时候,keyboard的Frame值
    CGRect old = [userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    //{{0, 667}, {375, 258}}";

    //UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 409}, {375, 258}}
    NSLog(@"%@",userInfo);
    //更改默认是图的Y值,向上移动-
    CGRect rectView = self.view.frame;
    rectView.origin.y = old.origin.y - rectView.size.height;
    //409 - 667 = -
    //667 - 667 = 0;
    //键盘收回的时候,keyboard的Frame值
    
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //通过获得键盘具体动画效果运行时间
    //做一个保护措施
    [UIView animateWithDuration:duration animations:^{
          self.view.frame = rectView;
    }];
  
    
    
    
    
    
    NSLog(@"keyboardChange %@",sender);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //即将滚动的时候,停止编辑
    [self.view endEditing:YES];
}

#pragma mark UITabelViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPMessageCell  * cell = [GPMessageCell messageCellWithTableView:tableView];
    cell.message = self.messageArray[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPMessage * message = self.messageArray[indexPath.row];
    return message.rowHeight;
//    return 100;
}

#pragma mrak UITextFieldDelegate

/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    
    CGRect rect = self.view.frame;
    rect.origin.y = -250;
    
    self.view.frame = rect;
    
    return YES;
}
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString * text =  textField.text;
    
    NSDictionary * dict = @{@"text":text,@"time":@"今天11:20",@"type":@(1)};
    
    //1.模拟一个模型数据
    GPMessage * message  = [GPMessage messageWithDict:dict];
    
    //构造一个可变长度的数组
    NSMutableArray * newArray = [NSMutableArray arrayWithArray:self.messageArray];
    
    [newArray addObject:message];
    //使用新创建的数据,把原来的不可变数组替换掉
    self.messageArray = newArray;
    
    //2.刷tableView
    [self.tableView reloadData];
    
    textField.text = @"";
    
    [self scrollToBottom];
    
    return YES;
}

- (void)scrollToBottom
{
    //自动定位到tableView的最后一行
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.messageArray.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//1.改变数据源
//2.刷新数据


@end
