//
//  DatabaseManager.m
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDB.h"

@interface DatabaseManager ()
{
    FMDatabase *_fmdb;
}
@end

@implementation DatabaseManager

+ (instancetype)defaultManager
{
    static DatabaseManager *manager = nil;
    
    @synchronized(self) {
        if (!manager) {
            manager = [[DatabaseManager alloc] init];
        }
    }
    return manager;
}

#pragma mark - 初始化并创建表
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/my.db"];
//        NSString *dbPath = @"/Users/mhz/Desktop/my.db";

        
        _fmdb = [[FMDatabase alloc] initWithPath:dbPath];
        
        BOOL isOpen = [_fmdb open];
        if (isOpen) {
            NSString *createSql = @"create table if not exists myCollection(name varchar(256),info varchar(2000),star varchar(256),commitDate varchar(256),category varchar(256),primary key(name,category))";
            
            BOOL isCreate = [_fmdb executeUpdate:createSql];
            if (!isCreate) {
                NSLog(@"create = %@", _fmdb.lastErrorMessage);
            }
            else {
                NSLog(@"表创建成功");
            }
        }
    }
    return self;
}

#pragma mark - 插入数据
- (BOOL)insertWithModel:(Model *)model
{
    NSString *insertSql = @"insert into myCollection values(?,?,?,?,?)";
    
    BOOL isInsert = [_fmdb executeUpdate:insertSql, model.name, model.info, model.star, model.commitDate, model.category];
    
    if (!isInsert) {
        NSLog(@"insert = %@", _fmdb.lastErrorMessage);
        return NO;
    }
    else {
        return YES;
    }
}

#pragma mark - 删除数据
- (BOOL)deleteWithModel:(Model *)model {
    NSString *deleteSql = @"delete from myCollection where name=? and category=?";
    BOOL isDelete = [_fmdb executeUpdate:deleteSql, model.name, model.category];
    if (!isDelete) {
        NSLog(@"delete = %@", _fmdb.lastErrorMessage);
        return NO;
    }
    else {
        return YES;
    }
}

#pragma mark - 更新数据
- (BOOL)updateWithModel:(Model *)model itemWithNameUpdateBefore:(NSString *)nameUpdateBefore{
    NSString *updateSql = @"update myCollection set name=?,info=?,star=?,commitDate=?,category=? where name=? and category=?";
    
    BOOL isUpdate = [_fmdb executeUpdate:updateSql, model.name, model.info, model.star, model.commitDate, model.category, nameUpdateBefore, model.category];
    
    if (!isUpdate) {
        NSLog(@"update = %@", _fmdb.lastErrorMessage);
        return NO;
    }
    else {
        return YES;
    }
}

#pragma mark - 查询数据
- (NSArray *)selectSetionWith:(NSString *)type andSort:(NSString *)sort {
    NSString *selectSql;
    if (!sort) {
        selectSql = @"select * from myCollection where category = ?";
    } else {
        selectSql = [NSString stringWithFormat:@"%@ order by %@", @"select * from myCollection where category = ?", sort];
    }
    
    FMResultSet *set = [_fmdb executeQuery:selectSql, type];
    
    NSMutableArray *temArray = [[NSMutableArray alloc] init];
    while ([set next]) {
        Model *model = [[Model alloc] init];
        model.name = [set stringForColumn:@"name"];
        model.info = [set stringForColumn:@"info"];
        model.star = [set stringForColumn:@"star"];
        model.commitDate = [set stringForColumn:@"commitDate"];
        model.category = [set stringForColumn:@"category"];
        
        [temArray addObject:model];
    }
    
    if ([sort isEqualToString:@"name"]) {
        
        // 计算中间时间
//        CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
        
        NSArray *sortedArray = [temArray sortedArrayUsingComparator:^(Model * m1,Model *m2) {

            if ([m1.name localizedCaseInsensitiveCompare:m2.name] == 1) {
                return NSOrderedDescending;
            } else {
                return NSOrderedAscending;
            }
        }];
        
//        CFAbsoluteTime end= CFAbsoluteTimeGetCurrent();
//        NSLog(@"time cost: %0.3f ms", (end - start)*1000);
        
        return sortedArray;
    }

    
    return temArray;
}

@end
