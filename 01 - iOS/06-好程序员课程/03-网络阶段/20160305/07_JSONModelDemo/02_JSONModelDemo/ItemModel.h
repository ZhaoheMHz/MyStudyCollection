//
//  ItemModel.h
//  02_JSONModelDemo
//
//  Created by baoxu on 15/9/2.
//  Copyright (c) 2015年 BaoXu. All rights reserved.
//

#import "JSONModel.h"
/**
 "applicationId": "757752585",
 "slug": "puzzle-chef",
 "name": "美味厨房",
 "releaseDate": "2014-09-17",
 "version": "1.3.0",
 */
@interface ItemModel : JSONModel

@property(nonatomic,retain) NSString *applicationId;
@property(nonatomic,retain) NSString *slug;
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *releaseDate;
@property(nonatomic,retain) NSString *version;

@end
