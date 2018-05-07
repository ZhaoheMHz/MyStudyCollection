//
//  GPTwoViewController.m
//  04-导航控制器的传值
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTwoViewController.h"

@interface GPTwoViewController ()

@property (nonatomic, weak)id target;
@property (nonatomic, assign)SEL action;

@end

@implementation GPTwoViewController

+(id)twoViewControllerWithNameTitle:(NSString *)nameTitle
{
    GPTwoViewController * towViewController = [[GPTwoViewController alloc] init];
    towViewController.nameText = nameTitle;
    return towViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self
                                 action:@selector(leftItemTouch)];
    
    
    
}

- (void)target:(id)target action:(SEL)action
{
    self.target = target;
    self.action = action;
}

- (void)leftItemTouch
{
    // [oneViewController twoViewControllerBackItemTouch:];
//    [self.delegate twoViewControllerBackItemTouch:self nameTitle:@"你好世界"];
    
//    self.oneViewController.navigationItem.title = @"你好";
    
    
    /*
    if(self.twoViewControllerBackItemTouchBlock)
    {
        self.twoViewControllerBackItemTouchBlock(self,@"block方式传值");
    }
    */
    
    [self.target performSelector:self.action withObject:@"action方式进行值的传递"];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
