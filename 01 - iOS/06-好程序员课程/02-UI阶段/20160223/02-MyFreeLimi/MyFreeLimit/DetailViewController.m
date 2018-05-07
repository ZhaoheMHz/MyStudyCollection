//
//  DetailViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-1-5.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "DetailViewController.h"

#import "NetInterface.h"

#import "QFDevice.h"

#import "UIView+QFExt.h"
#import "DataCenter.h"

#import "MyHelpViewController.h"

#import "UMSocial.h"

#import "QuickControl.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface DetailViewController ()
{
    UIScrollView *snapshotScrollView;
    NSMutableArray *nearbyAppArray;
    UIScrollView *neaybyAppScrollView;
    
    UIImageView *iconImageView;
    UILabel *infoLabel;
    
}
@end

@implementation DetailViewController


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
    

    //添加记录
    [[DataCenter sharedInstance] addAppRecord:self.model];
    
    
    //设置导航栏
    self.navigationItem.title = @"应用详情";
    
    //创建顶部视图
    [self createTopView];
    

    [self startDownloadSnapshootData];
    
    
    //创建底部视图
    [self createBottomView];
    
    nearbyAppArray = [[NSMutableArray alloc] init];
    

    [self startDownloadNearbyData];
    
}

#pragma mark - 顶部视图

#define ShareTag 100
#define FavTag 101
#define DownTag 102

-(void)createTopView
{
    float y = 3;
    if ([QFDevice getOSVersion] >= 7) {
        
    }
    
    UIImageView *bg = [QuickControl imageViewWithFrame:CGRectMake(10, y, 300, 280) imageFile:@"appdetail_background.png"];
    
    
    iconImageView = [QuickControl imageViewWithFrame:CGRectMake(10, 10, 70, 70) imageFile:nil];
    [iconImageView setImageWithURL:[NSURL URLWithString:_model.iconUrl]];
    [iconImageView makeCorner:14];
    [bg addSubview:iconImageView];
    
    
    UILabel *nameLabel = [QuickControl labelWithFrame:CGRectMake(90, 8, 300-100, 30) title:_model.name];
    [bg addSubview:nameLabel];
    
    UILabel *origPriceLabel = [QuickControl labelWithFrame:CGRectMake(90, 40,300-100, 20) title:[NSString stringWithFormat:@"原价$%@ 限免中",self.model.lastPrice]];
    origPriceLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:origPriceLabel];
    
    
    UILabel *sizeLabel = [QuickControl labelWithFrame:CGRectMake(220, 40,300-100, 20) title:[NSString stringWithFormat:@"%@MB",self.model.fileSize]];
    origPriceLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:sizeLabel];
    
    UILabel *typeLabel = [QuickControl labelWithFrame:CGRectMake(90, 62,300-100, 20) title:[NSString stringWithFormat:@"类型: %@",self.model.categoryName]];
    origPriceLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:typeLabel];
    
    UILabel *starLabel = [QuickControl labelWithFrame:CGRectMake(210, 62,300-100, 20) title:[NSString stringWithFormat:@"评分: %@",self.model.starOverall]];
    origPriceLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:starLabel];
    
    
    
    //三个按钮: 分享, 收藏, 下载
    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"分享",@"收藏",@"下载",nil];
    for (int i=0; i<3; i++) {
        //0, 90, 100, 40
        double w=100;
        double h=40;
        double x=i*w;
        double y=90;
        UIButton *button = [QuickControl imageButtonWithFrame:CGRectMake(x, y, w, h) title:titleArray[i] imageFile:@"Detail_btn_left.png" target:self action:@selector(buttonClick:) tag:100+i];
        [bg addSubview:button];
        
        if(i == 1)
        {
            DataCenter *dc = [DataCenter sharedInstance];
            if([dc isExistFavoriteRecord:self.model])
            {
                [button setTitle:@"取消收藏" forState:UIControlStateNormal];
            }
        }
    }
    
    //滚动视图显示应用截图
    // 放scrollview滚动视图
    CGRect rect9 = CGRectMake(10, 135, 280, 88);
    snapshotScrollView = [[UIScrollView alloc] initWithFrame:rect9];
    float kOffset = 5;
    float width = 280/5-kOffset;
    int i;
    //暂时先添加10个小图片
    for (i = 0; i < 10; i++) {
        float x = i*(width+kOffset);
        CGRect rect10 = CGRectMake(x, 0, width, 88);
        UIImageView *iv = [[UIImageView alloc] initWithFrame:rect10];
        iv.backgroundColor = [UIColor redColor];
        
        [snapshotScrollView addSubview:iv];
    }
    snapshotScrollView.showsHorizontalScrollIndicator = NO;
    snapshotScrollView.contentSize = CGSizeMake(i*(width+kOffset), 88);
    [bg addSubview:snapshotScrollView];
    
    
    
    
    
    //文本显示应用信息
    infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 135+88+5, 280, 45)];
    infoLabel.backgroundColor = [UIColor clearColor];
    infoLabel.text = self.model.description;
    infoLabel.numberOfLines = 3; //
    infoLabel.font = [UIFont systemFontOfSize:10];
    infoLabel.text = self.model.description;
    [bg addSubview:infoLabel];
    
    
    
    [self.view addSubview:bg];
    
}

- (void) reloadScrollView {
    // 1. 把之前上面的都删除 ....
    NSArray *allViews = [snapshotScrollView subviews];
    for (UIView *view in allViews) {
        [view removeFromSuperview];
    }
    //
    // 2. 重新创建
    float kOffset = 5;
    float width = 280/5-kOffset;
    
    int i;
    for (i = 0; i < _model.photoArray.count; i++) {
        PhotoModel *amp = [_model.photoArray objectAtIndex:i];
        float x = i*(width+kOffset);
        CGRect rect10 = CGRectMake(x, 0, width, snapshotScrollView.height);
        UIImageView *iv = [[UIImageView alloc] initWithFrame:rect10];
        iv.tag = i+1;
        // 方法1 触摸（缺点不同通用）
        //        iv.userInteractionEnabled = YES;
        // 方法2. 继承
        //[iv addTarget:self withSelector:@selector(imageClick:)];
        //让这个可以点击...
        [iv setImageWithURL:[NSURL URLWithString:amp.smallUrl]];
        
        //为此处的图片添加点击手势
        iv.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(smallImageTouch:)];
        [iv addGestureRecognizer:tap];
        
        
        [snapshotScrollView addSubview:iv];
    }
    snapshotScrollView.contentSize = CGSizeMake(MAX(snapshotScrollView.width, i*(width+kOffset)+1)+1, snapshotScrollView.height);
}

-(void)smallImageTouch:(UITapGestureRecognizer *)tap
{
    
    NSLog(@"smallImageTouch");
    NSLog(@"appid = %@",self.model.applicationId);
    
    NSMutableArray *orignalImageArray = [[NSMutableArray alloc] init];
    for (int i=0; i<self.model.photoArray.count; i++) {
        PhotoModel *appModelPhoto = self.model.photoArray[i];
        [orignalImageArray addObject: appModelPhoto.originalUrl];
    }
    
    MyHelpViewController *mhvc = [[MyHelpViewController alloc] init];
    mhvc.imageFileArray = orignalImageArray;
    [self.navigationController pushViewController:mhvc animated:YES];

    
}

- (void) buttonClick:(UIButton *)button {
    
    //NSLog(@"button.tag = %d",button.tag);
    
    //获取数据中心的单例
    DataCenter *dc = [DataCenter sharedInstance];
    
    if (button.tag == ShareTag) {
        
        //分享 应用名字, icon
        //新浪微博, 微信好友, 微信圈子,邮件,短信   取消
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"新浪微博",@"微信好友",@"微信圈子",@"邮件",@"短信",nil];
        
        [actionSheet showInView:self.view];
        
    }
    else if(button.tag == FavTag)
    {
        NSLog(@"FAV->%d",[dc isExistFavoriteRecord:self.model]);
        
        //收藏时需要把它存储到数据库中
        //如果存在这条收藏记录
        if([dc isExistFavoriteRecord:self.model])
        {
            [dc deleteFavoriteRecord:self.model];
            [button setTitle:@"收藏" forState:UIControlStateNormal];
        }
        else
        {
            [dc addFavoriteRecord:self.model];
            [button setTitle:@"取消收藏" forState:UIControlStateNormal];
        }
        
    }
    else if(button.tag == DownTag)
    {
        //应用下载记录
        if(![dc isExistDownloadRecord:self.model])
        {
            [dc addDownloadRecord:self.model];
        }
        

        
        // 这个程序是打开AppStore
        
        //NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/guang-dian-bi-zhi/id%d?mt=8", self.model.applicationId];
        //NSLog(@"url = %@",url);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.model.itunesUrl]];
  
        //1.打开AppStore
        /*
        //如果需要兼容6.0以下的设备，可以使用下面的代码（这种方式会跳出当前应用）：

        - (void)outerOpenAppWithIdentifier:(NSString *)appId {
            NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/us/app/id%@?mt=8", appId];
            NSURL *url = [NSURL URLWithString:urlStr];
            [[UIApplication sharedApplication] openURL:url];
        }
        */
        
        //打开网址
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://baidu.com"]];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSArray *shareType = [[NSArray alloc] initWithObjects:
                          UMShareToSina,
                          UMShareToWechatSession,
                          UMShareToWechatTimeline,
                          UMShareToEmail,
                          UMShareToSms, nil];
    
    if(buttonIndex < shareType.count)
    {
        NSString *shareInfo = self.model.name;
        [[UMSocialControllerService defaultControllerService] setShareText:shareInfo shareImage:iconImageView.image socialUIDelegate:self];     //设置分享内容和回调对象
        [UMSocialSnsPlatformManager getSocialPlatformWithName:shareType[buttonIndex]].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    }
    
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

#pragma mark - 下载和解析应用的截图

-(void)startDownloadSnapshootData
{
    
    // 显示一个HUB进度表 显示....
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:nil status:@"正在加载数据"];
    
    
    
    
    //下载数据
    //创建下载地址
    NSString *s = [NSString stringWithFormat:DETAIL_URL, self.model.applicationId.intValue];
    NSLog(@"s = %@",s);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:s parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //解析下载的数据为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //获取其中的图片数据
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (NSDictionary *photoDict in [dict objectForKey:@"photos"]) {
            
            PhotoModel *photoModel = [[PhotoModel alloc] init];
            photoModel.smallUrl = photoDict[@"smallUrl"];
            photoModel.originalUrl = photoDict[@"originalUrl"];
            
            [array addObject:photoModel];
        }
        self.model.photoArray = array;
        
        
        //刷新滚动视图
        [self reloadScrollView];
        
        //从附近的人点击进入后需要 -----   刷新描述标签
        self.model.desc = dict[@"description"];
        infoLabel.text = self.model.description;
        
        //显示进度提示
        [MMProgressHUD dismissWithSuccess:@"成功下载了"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - 底部视图

-(void)createBottomView
{
    //appdetail_recommend.png
    float y = 282;
    if ([QFDevice getOSVersion] >= 7) {
        
    }
    
    CGRect rect = CGRectMake(10, y, 300, 90);
    UIImageView *bg = [[UIImageView alloc] initWithFrame:rect];
    bg.image = [UIImage imageNamed:@"appdetail_recommend.png"];
    bg.userInteractionEnabled = YES;
    [self.view addSubview:bg];
    
    //添加显示附近应用的滚动视图
    //滚动视图显示应用截图
    // 放scrollview滚动视图
    CGRect rect9 = CGRectMake(10, 17, 280, 60);
    neaybyAppScrollView = [[UIScrollView alloc] initWithFrame:rect9];
    [bg addSubview:neaybyAppScrollView];
    
    

}

#pragma mark - 下载和解析附近应用数据

-(void)startDownloadNearbyData
{
    // 显示一个HUB进度表 显示....
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:nil status:@"正在加载数据"];
    
    
    
    //下载附近使用数据 longitude=%lf&latitude=%lf
    double longitude = 116.344539;
    double latitude = 40.034346;
    NSString *nearbyUrl = [NSString stringWithFormat:NEARBY_APP_URL, longitude, latitude];
    //NSLog(@"nearbyUrl = %@",nearbyUrl);
    
    
    //网络下载数据
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:nearbyUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"nearby dict = %@",dict);
        
        self.model.desc = dict[@"description"];
        
        NSArray *arr = [dict objectForKey:@"applications"];
        for (NSDictionary *appDict in arr) {
            //NSLog(@"nearby id=%@,name=%@",model.applicationId,model.name);
            
            //创建数据模型对象,加入数据数组
            AppModel *model = [[AppModel alloc] init];
            
            for (NSString *key in appDict) {
                [model setValue:appDict[key] forKey:key];
            }
            [nearbyAppArray addObject:model];
            
            
        }
        
        //刷新显示附近应用--滚动视图
        [self reloadNearbyAppScrollView];
        
        
        //显示进度提示
        [MMProgressHUD dismissWithSuccess:@"成功下载了"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}



- (void) reloadNearbyAppScrollView {
    // 1. 把之前上面的都删除 ....
    NSArray *allViews = [neaybyAppScrollView subviews];
    for (UIView *view in allViews) {
        [view removeFromSuperview];
    }
    //
    // 2. 重新创建

    float kOffset = 10;
    float width = 280/5-kOffset;
    float height = width;
    
    int i;
    for (i = 0; i < nearbyAppArray.count; i++) {
        AppModel *amp = [nearbyAppArray objectAtIndex:i];
        float x = i*(width+kOffset);
        CGRect rect10 = CGRectMake(x, 0, width, height);
        UIImageView *iv = [[UIImageView alloc] initWithFrame:rect10];
        iv.tag = i+1;
        // 方法1 触摸（缺点不同通用）
        //        iv.userInteractionEnabled = YES;
        // 方法2. 继承
        //[iv addTarget:self withSelector:@selector(imageClick:)];
        //让这个可以点击...
        [iv makeCorner:5];
        [iv setImageWithURL:[NSURL URLWithString:amp.iconUrl]];
        iv.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(appIconClick:)];
        
        //ARC需要这样写
        
        iv.tag = (int)CFBridgingRetain(amp);
        
        [iv addGestureRecognizer:tap];
        [neaybyAppScrollView addSubview:iv];
        
        //显示应用名称
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(x+2, 38, width+10, 30)];
        nameLabel.text = amp.name;
        nameLabel.font = [UIFont systemFontOfSize:12];
        [neaybyAppScrollView addSubview:nameLabel];
        
    }
    neaybyAppScrollView.contentSize = CGSizeMake(MAX(neaybyAppScrollView.width, i*(width+kOffset)+1)+1, neaybyAppScrollView.height+30);
    
}

//处理应用图标的点击事件
-(void)appIconClick:(UITapGestureRecognizer *)tap
{
    //ARC下需要这样写
    AppModel *model = (AppModel *)CFBridgingRelease((void *)tap.view.tag);
    
    //创建细节界面
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.model = model;
    [self.navigationController pushViewController:dvc animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
