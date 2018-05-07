//
//  ZHRequestViewModel.h
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHRequestViewModel : NSObject

//模型数组
@property (nonatomic, strong) NSArray *models;

// 网络请求的command
@property (nonatomic, strong, readonly) RACCommand *requestCommand;

@end
