//
//  ZHSQLTool.h
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/13.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZHSQLTool;



@protocol ISSelectEnable;
@protocol ISFromEnable;
@protocol ISJoinEnable;
@protocol ISWhereEnable;

typedef ZHSQLTool<ISFromEnable> *(^selectBlock)(NSString *str);
typedef ZHSQLTool<ISJoinEnable, ISWhereEnable> *(^fromBlock)(NSString *str);
typedef ZHSQLTool<ISJoinEnable, ISWhereEnable> *(^joinBlock)(NSString *str);
typedef ZHSQLTool *(^whereBlock)(NSString *str);

@protocol ISSelectEnable <NSObject>
// 协议中不允许存在属性，这里只是用来方便生成get方法
@property (nonatomic, copy) selectBlock select;
@end

@protocol ISFromEnable <NSObject>
@property (nonatomic, copy) fromBlock from;
@end

@protocol ISJoinEnable <NSObject>
@property (nonatomic, copy) joinBlock join;
@end

@protocol ISWhereEnable <NSObject>
@property (nonatomic, copy) whereBlock where;
@end



@interface ZHSQLTool : NSObject



// 函数的入参是一个block
// makeSql被调用的时候，书写block的实现
// block在makeSql的实现中会被调用block(ZHSQLTool)，所以在makeSql被调用的时候，也就拿到了ZHSQLTool
+ (NSString *)makeSql:(void(^)(ZHSQLTool<ISSelectEnable> *tool))block;

@end
