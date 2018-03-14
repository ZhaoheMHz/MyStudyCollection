//
//  ZHSQLTool.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/13.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHSQLTool.h"

//通过Class Extension让SQLTool遵循所有的协议
@interface ZHSQLTool()<ISSelectEnable, ISFromEnable, ISJoinEnable, ISWhereEnable>

// 用户不需要直接对sql结果直接进行操作，
@property (nonatomic, strong) NSMutableString *sql;

@end

@implementation ZHSQLTool

+ (NSString *)makeSql:(void(^)(ZHSQLTool<ISSelectEnable> *tool))block {
    // 创建一个ZHSQLTool的实例传给block
    ZHSQLTool<ISSelectEnable> *tool = [[ZHSQLTool<ISSelectEnable> alloc] init];
    if (block) {
        block(tool);
    }
    return tool.sql;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sql = [[NSMutableString alloc] init];
    }
    return self;
}

- (selectBlock)select {
    return ^(NSString *str){
        [_sql appendString:@"select "];
        [_sql appendString:str];
        [_sql appendString:@" "];
        return self;
    };
}

- (fromBlock)from {
    return ^(NSString *str){
        [_sql appendString:@"from "];
        [_sql appendString:str];
        [_sql appendString:@" "];
        return self;
    };
}

- (joinBlock)join {
    return ^(NSString *str) {
        [_sql appendString:@"join "];
        [_sql appendString:str];
        [_sql appendString:@" "];
        return self;
    };
}

- (whereBlock)where {
    return ^(NSString *str){
        [_sql appendString:@"where "];
        [_sql appendString:str];
        [_sql appendString:@" "];
        return self;
    };
}

@end
