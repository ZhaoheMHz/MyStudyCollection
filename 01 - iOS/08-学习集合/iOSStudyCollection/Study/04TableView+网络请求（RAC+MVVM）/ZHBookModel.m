//
//  ZHBookModel.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHBookModel.h"

@implementation ZHBookModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self.title = dict[@"title"];
    self.subtitle = dict[@"subtitle"];
    
    return self;
}

@end
