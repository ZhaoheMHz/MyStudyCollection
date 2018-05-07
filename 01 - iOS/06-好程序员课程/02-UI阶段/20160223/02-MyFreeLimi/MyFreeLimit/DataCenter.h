//
//  DatabaseCenter.h
//  MyFreeLimit
//
//  Created by mac on 14-4-11.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "AppModel.h"

@interface DataCenter : NSObject
{
    // 定义一个数据库对象
    FMDatabase *_mydb;
}
//获取单例对象的方法
+(id)sharedInstance;

//点击记录记录相关
-(BOOL) isExistAppRecord:(AppModel *)model;
-(void) addAppRecord:(AppModel *)model;
-(void) deleteAppRecord:(AppModel *)model;
- (NSArray *) getAllBrowseArray;

//收藏记录相关
-(BOOL) isExistFavoriteRecord:(AppModel *)model;
-(void) addFavoriteRecord:(AppModel *)model;
-(void) deleteFavoriteRecord:(AppModel *)model;
-(NSUInteger) getAppFavoriteCount;
-(NSArray *) getAllFavoriteArray;

//下载记录相关
-(BOOL) isExistDownloadRecord:(AppModel *)model;
-(void) addDownloadRecord:(AppModel *)model;
-(NSUInteger) getAppDownloadCount;
-(NSArray *) getAllDownloadArray;

@end
