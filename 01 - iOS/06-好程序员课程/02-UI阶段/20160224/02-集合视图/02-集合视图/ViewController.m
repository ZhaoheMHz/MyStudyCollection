//
//  ViewController.m
//  02-集合视图
//
//  Created by 哲 肖 on 16/2/24.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UICollectionViewDataSource

//有多少组的数据?
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
//每一组显示多少个 item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //注册需要重用的cell具体类型
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    //从缓存池中取出cell对象
    UICollectionViewCell * cell =   [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //添加子控件 到contentView中
    UILabel * label = [[UILabel alloc] init];
    label.text = @"text";
    label.frame = CGRectMake(0, 0, 100, 30);
    [cell.contentView addSubview:label];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
    
    //ios6.0
    /*
    UICollectionViewCell * cell = [[UICollectionViewCell alloc] init];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"text";
    label.frame = CGRectMake(0, 0, 100, 30);
    
    [cell.contentView addSubview:label];
    
    return cell;
     */
}

#pragma mark UICollectionViewDelegateFlowLayout
//设置每一个item的宽度高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 140);
}

//
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * resuableView = nil;
    //每一组头部显示的视图
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        //注册,需要重用的视图类型
        [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        //从缓存池中取出一个具体的可重用视图
        resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        resuableView.backgroundColor = [UIColor greenColor];
        
    }//每一组尾部显示的视图
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        //注册,需要重用的视图类型
        [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        
        //从缓存池中取出一个具体的可重用视图
        resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        resuableView.backgroundColor = [UIColor yellowColor];

    }
    
    return resuableView;
}

//设置分组头部,与分组尾部的宽度与高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.frame.size.width, 100);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.frame.size.width, 70);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    return UIEdgeInsetsMake(100, 20, 50, 20);
}

//点击了某一个item的时候,会调用的代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了 某一个Item %ld 组 %ld",indexPath.item,indexPath.section);
}


@end
