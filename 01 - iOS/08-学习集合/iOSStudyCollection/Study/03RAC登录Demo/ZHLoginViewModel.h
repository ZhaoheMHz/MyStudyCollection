//
//  ZHLoginViewModel.h
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHAccountModel.h"


@interface ZHLoginViewModel : NSObject

@property (nonatomic, strong) ZHAccountModel *account;

@property (nonatomic, strong, readonly) RACSignal *enableLoginBtnSignal;
@property (nonatomic, strong, readonly) RACCommand *loginCommand;

@end
