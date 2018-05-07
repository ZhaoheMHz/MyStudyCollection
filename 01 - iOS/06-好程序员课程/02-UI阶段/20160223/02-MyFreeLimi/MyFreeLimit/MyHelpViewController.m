//
//  MyHelpViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-12.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MyHelpViewController.h"

#import "UIView+QFExt.h"

#import "UIImageView+AFNetworking.h"

@interface MyHelpViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation MyHelpViewController

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
    
    self.navigationItem.title = @"我的帮助";
    self.view.backgroundColor = [UIColor blackColor];
    //self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    
    //隐藏状态栏,此句在ios7中失效
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    
    //隐藏标签栏
    [self.tabBarController.tabBar setHidden:YES];
    
    
    
    //
    /*
    _imageFileArray = [[NSArray alloc] initWithObjects:@"helpphoto_one.png",
    @"helpphoto_two.png",
    @"helpphoto_three.png",
    @"helpphoto_four.png",
    @"helpphoto_five.png",nil];
     */
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    _scrollView.contentSize = CGSizeMake(_scrollView.width * _imageFileArray.count, _scrollView.height);
    //附加
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    
    for (int i=0; i<_imageFileArray.count; i++) {
        double x = _scrollView.width * i;
        double y = 0;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x+20, y+20, _scrollView.width-40, _scrollView.height-40)];
        if([_imageFileArray[i] hasPrefix:@"http://"])
        {
            //以前错误的写法
            //[imageView setImageWithURL:_imageFileArray[i]];
            [imageView setImageWithURL:[NSURL URLWithString:_imageFileArray[i]]];
            NSLog(@"imageView = %@",_imageFileArray[i]);
        }
        else
        {
            imageView.image = [UIImage imageNamed:_imageFileArray[i]];
        }
        [_scrollView addSubview:imageView];
    }
    
    [self.view addSubview:_scrollView];

    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
}

//隐藏状态栏
/*
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
 */

//UIStatusBarStyleDefault
//UIStatusBarStyleLightContent

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
