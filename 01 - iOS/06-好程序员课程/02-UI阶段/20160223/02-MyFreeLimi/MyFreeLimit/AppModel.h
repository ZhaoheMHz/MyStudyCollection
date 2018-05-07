//
//  AppModel.h
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PhotoModel : NSObject
@property (copy) NSString * smallUrl;
@property (copy) NSString * originalUrl;
@end


@interface AppModel : NSObject

@property (copy,nonatomic) NSString *applicationId;
@property (copy,nonatomic) NSString *slug;
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *releaseDate;
@property (copy,nonatomic) NSString *version;
//@property (copy,nonatomic) NSString *description;

@property (copy,nonatomic) NSString *desc;

@property (copy,nonatomic) NSString *categoryId;
@property (copy,nonatomic) NSString *categoryName;
@property (copy,nonatomic) NSString *iconUrl;
@property (copy,nonatomic) NSString *itunesUrl;
@property (copy,nonatomic) NSString *starCurrent;
@property (copy,nonatomic) NSString *starOverall;
@property (copy,nonatomic) NSString *ratingOverall;
@property (copy,nonatomic) NSString *downloads;
@property (copy,nonatomic) NSString *currentPrice;
@property (copy,nonatomic) NSString *lastPrice;
@property (copy,nonatomic) NSString *priceTrend;
@property (copy,nonatomic) NSString *expireDatetime;
@property (copy,nonatomic) NSString *releaseNotes;
@property (copy,nonatomic) NSString *updateDate;
@property (copy,nonatomic) NSString *fileSize;
@property (copy,nonatomic) NSString *ipa;
@property (copy,nonatomic) NSString *shares;
@property (copy,nonatomic) NSString *favorites;

@property (copy,nonatomic) NSString *comment;


@property (copy,nonatomic) NSMutableArray *photoArray;
/*
//添加图片和获取图片数组
- (void) addPhotoWithSmallUrl:(NSString *)smallUrl withOrignalUrl:(NSString *)orignalUrl;
- (NSArray *) photoArray;
*/

@end
