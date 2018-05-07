//
//  MyConnection.h
//  00_HomeWork
//
//  Created by baoxu on 15/11/27.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyConnectionDelegate;

@interface MyConnection : NSObject<NSURLConnectionDataDelegate>

@property(nonatomic,assign)float totalSize;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)NSMutableData *conData;
@property(nonatomic,assign)long tag;

@property(nonatomic,weak)id<MyConnectionDelegate> delegate;

-(id)initWithUrl:(NSString *)url Delegate:(id)delegate;

@end

@protocol MyConnectionDelegate <NSObject>

-(void)downloadFinish:(MyConnection *)con Data:(NSData *)data;
-(void)downloadFail:(MyConnection *)con;
-(void)downloadDidReceive:(MyConnection *)con Progress:(float)progress;

@end


