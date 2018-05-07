//
//  SettingViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "SettingViewController.h"

#import "MySettingViewController.h"
#import "MyCollectViewController.h"
#import "MyDownloadViewController.h"

#import "MyFavoriteViewController.h"
#import "MyCandouViewController.h"
#import "MyHelpViewController.h"
#import "MyUserViewController.h"


@interface SettingViewController ()
{
    NSMutableArray *_buttonArray;
}
@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = @"设置详情";
    
    
    [self createUI];
    
}

-(void)createUI
{
    self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    
    
    _buttonArray = [[NSMutableArray alloc] init];
    
    NSArray *buttonImageFileArray = [[NSArray alloc] initWithObjects:
        @"setting",@"favorite",@"user",
        @"collect",@"download",@"comment",
        @"help",@"candou",@"",nil];
    
    NSArray *buttonBottomTitleArray = [[NSArray alloc] initWithObjects:
                   @"我的设置",@"我的关注",@"我的账户",
                   @"我的收藏",@"我的下载",@"我的评论",
                   @"我的帮助",@"蚕豆应用",@"",nil];
    
    int inteval = 35;
    double w = 57;
    double h = 57;
    int index=0;
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            
            //创建了8个按钮,
            if(index < 8)
            {
                
                double x = 35 + j * (w+inteval);
                double y = 40 + i * (h+inteval);
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(x, y, w, h);
                NSString *imageFile = [NSString stringWithFormat:@"account_%@.png",buttonImageFileArray[index]];
                [button setBackgroundImage:[UIImage imageNamed:imageFile] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                button.tag = 100 + index;
                [self.view addSubview:button];
                
                //按钮下方文字
                UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y + 45, w, h)];
                bottomLabel.text = buttonBottomTitleArray[index];
                bottomLabel.font = [UIFont systemFontOfSize:12];
                [self.view addSubview:bottomLabel];
            }
            
            index++;
        }
    }
}



-(void)btnClick:(UIButton *)button
{
    //详情界面-(分享, 收藏, 下载)
    
    int index = button.tag - 100;
    
    //切换到 我的设置界面
    if (index == 0) {
        MySettingViewController *msvc = [[MySettingViewController alloc] init];
        [self.navigationController pushViewController:msvc animated:YES];
    }
    
    //切换到 我的关注界面
    if (index == 1) {
        MyFavoriteViewController *msvc = [[MyFavoriteViewController alloc] init];
        [self.navigationController pushViewController:msvc animated:YES];
    }
    
    //切换到 我的账户界面
    if (index == 2) {
        MyUserViewController *msvc = [[MyUserViewController alloc] init];
        [self.navigationController pushViewController:msvc animated:YES];
    }
    
    //打开收藏界面
    if (index == 3) {
        MyCollectViewController *mcvc = [[MyCollectViewController alloc] init];
        [self.navigationController pushViewController:mcvc animated:YES];
    }
    
    //打开下载界面
    if (index == 4) {
        MyDownloadViewController *mdvc = [[MyDownloadViewController alloc] init];
        [self.navigationController pushViewController:mdvc animated:YES];
    }
    
    //打开评论界面
    if (index == 5) {
        
        
        //直接跳转到 App Store 评论界面
    }
    
    //打开帮助界面
    if (index == 6) {
        MyHelpViewController *mdvc = [[MyHelpViewController alloc] init];
        
        //[self presentViewController:mdvc animated:YES completion:nil];
        mdvc.imageFileArray = [[NSArray alloc] initWithObjects:@"helpphoto_one.png",
                               @"helpphoto_two.png",
                               @"helpphoto_three.png",
                               @"helpphoto_four.png",
                               @"helpphoto_five.png",nil];
        
        [self.navigationController pushViewController:mdvc animated:YES];
    }
    
    //打开蚕豆界面
    if (index == 7) {
        MyCandouViewController *mdvc = [[MyCandouViewController alloc] init];
        [self.navigationController pushViewController:mdvc animated:YES];
    }
    
    /*
     switch (index) 
     case(){
     
     }
     case(){
     
     }
     case(){
     
     }
     case(){
     
     }
     */
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
