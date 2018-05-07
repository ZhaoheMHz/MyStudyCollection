//
//  DatabaseManager.m
//  A1fmdb
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDB.h"

@interface DatabaseManager ()

{
    // 对数据库的操作都是通过一个FMDatabase对象来进行的
    FMDatabase *_fmdb;
}

@end

@implementation DatabaseManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 数据库的路径
        NSString *sqlPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/qf.db"];
        
        // 创建操作数据库的对象
        _fmdb = [[FMDatabase alloc] initWithPath:sqlPath];
        
        // 打开数据库并判断是否成功,如果数据库已经存在,会直接打开;如果数据库不存在,就先创建,再打开
        BOOL isOpen = [_fmdb open];
        
        if (isOpen) {
            // 创建表
            // primary key:主键;  autoincrement:主键自动增长;   default 0:默认值为0
            NSString *createSql = @"create table if not exists userInfo(id integer primary key autoincrement,name varchar(256),age integer default 0,image blob)";
            
            //  执行sql语句并判断是否成功(增删改够用execute)
            BOOL isCreate = [_fmdb executeUpdate:createSql];
            
            if (!isCreate) {
                // 如果sql语句执行失败,就打印错误信息
                NSLog(@"create = %@", _fmdb.lastErrorMessage);
            }
            else {
                NSLog(@"表创建成功");
            }
        }
    }
    return self;
}

// 获取数据管理者的单例对象
+ (instancetype)defaultManager
{
    static DatabaseManager *dm = nil;
    @synchronized (self) {
        if (!dm) {
            dm = [[DatabaseManager alloc] init];
        }
    }
    
    return dm;
}

// 插入一条数据
- (void)insertWithModel:(Person *)ps
{
    NSString *insertSql = @"insert into userInfo(name,age,image) values(?,?,?)";
    
    // ?,?,?通配符接续到sql语句后面
    BOOL isInsert = [_fmdb executeUpdate:insertSql, ps.nameStr, ps.ageStr, ps.iconData];
    
    if (!isInsert) {
        // 如果sql语句执行失败,就打印错误信息
        NSLog(@"insert = %@", _fmdb.lastErrorMessage);
    }
    else {
        NSLog(@"插入了一条数据");
    }
}

// 将id为pId的数据修改成ps里记录的数据
- (void)updateWithModel:(Person *)ps forId:(int)pId
{
    NSString *updateSql = @"update userInfo set name=?,age=?,image=? where id=?";
    
    // @(pId)讲pId转换成NSNumber类型,这里传的数据,只能是对象类型,否则会崩崩崩崩!!!!!!!!!!!!!
    BOOL isUpdate = [_fmdb executeUpdate:updateSql, ps.nameStr, ps.ageStr, ps.iconData, @(pId)];
    if (!isUpdate) {
        NSLog(@"update = %@", _fmdb.lastErrorMessage);
    }
    else {
        NSLog(@"修改数据成功");
    }
}

// 从数据库中查询所有的数据
- (NSArray *)selectAllModel
{
    // 查询
    NSString *selectSql = @"select * from userInfo";
    
    // 执行询,获取结果
    FMResultSet *set = [_fmdb executeQuery:selectSql];
    
    NSMutableArray *temArr = [NSMutableArray array];
    while ([set next]) {
        // 在这个循环内部,set会依次代表所有的数据
        Person *ps = [[Person alloc] init];
        
        // 从set中取数据
        ps.nameStr = [set stringForColumn:@"name"];
        ps.ageStr = [set stringForColumn:@"age"];
        ps.iconData = [set dataForColumn:@"image"];
        
        [temArr addObject:ps];
    }
    
    return temArr;
}
@end
