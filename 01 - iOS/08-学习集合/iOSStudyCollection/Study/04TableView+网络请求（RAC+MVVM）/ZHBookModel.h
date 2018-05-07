//
//  ZHBookModel.h
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHBookModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
