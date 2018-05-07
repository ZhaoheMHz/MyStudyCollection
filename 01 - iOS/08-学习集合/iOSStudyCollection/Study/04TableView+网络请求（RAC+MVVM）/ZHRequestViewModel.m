//
//  ZHRequestViewModel.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHRequestViewModel.h"
#import "ZHBookModel.h"

@interface ZHRequestViewModel() <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ZHRequestViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initBind];
    }
    return self;
}

// 初始化数据的绑定、command
- (void)initBind {
    // 初始化command
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 进行网络请求
            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
            parameters[@"p"] = @"基础";
            
            // 发送请求
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFCompoundResponseSerializer serializer];
            [manager GET:@"http://www.greatchef.com.cn/m/Me/delFollow" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 请求成功，发送数据，这里模拟下假数据
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
            return nil;
        }];
        
        return [requestSignal map:^id _Nullable(id  _Nullable value) {
            // 模拟假数据
            NSArray *dictArr = @[@{@"title": @"iOS逆向工程", @"subtitle": @"一本好书"}, @{@"title": @"iOS52个高效开发tpis", @"subtitle": @"好啊好啊"}, @{@"title": @"iOS从入门到入土", @"subtitle": @"我死了啊"}];
            
            // 字典转模型
            return [[dictArr.rac_sequence map:^id _Nullable(id  _Nullable value) {
                return [[ZHBookModel alloc] initWithDict:value];
            }] array];  // map方法返回一个RACSequence，调用array方法，成为数组
        }];
    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    ZHBookModel *book = self.models[indexPath.row];
    cell.detailTextLabel.text = book.subtitle;
    cell.textLabel.text = book.title;
    
    return cell;
}

@end
