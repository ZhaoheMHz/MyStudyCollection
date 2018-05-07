//
//  GPLarge.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPLarge.h"

@implementation GPLarge

+ (id)largeWithDict:(NSDictionary *)dict
{
    GPLarge * large = [self newsWithDict:dict];
    
    //1.titleFrame
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = 375;
    
    CGSize size = CGSizeMake(titleW,CGFLOAT_MAX);
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    size = [large.title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGFloat titleH = size.height;
    large.titleFrame = CGRectMake(titleX, titleY, titleW, titleH);
    
    //2.pictureFrame
    CGFloat pictureX = 0;
    CGFloat pictureY = CGRectGetMaxY(large.titleFrame);
    CGFloat pictureW = 359;
    CGFloat pictureH = 101;
    large.pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    //3.sourc
    CGFloat sourceX = 0;
    CGFloat sourceY = CGRectGetMaxY(large.pictureFrame);
    CGFloat sourceW = 200;
    CGFloat sourceH = 20;
    large.sourceFrame = CGRectMake(sourceX, sourceY, sourceW, sourceH);
    //4.time
    CGFloat timeX = 100;
    CGFloat timeY = CGRectGetMaxY(large.pictureFrame);
    CGFloat timeW = 200;
    CGFloat timeH = 20;
    large.timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    
    //5.rowHeight
    large.rowHeight = CGRectGetMaxY(large.sourceFrame);
    
    return large;
}


@end
