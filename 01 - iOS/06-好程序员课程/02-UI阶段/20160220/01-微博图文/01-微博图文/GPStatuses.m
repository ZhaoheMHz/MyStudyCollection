//
//  GPStatuses.m
//  01-微博图文
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPStatuses.h"

@implementation GPStatuses

+(id)statusesWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
        
        
        
        
        //2.1 计算iconImageViewFrame值
        CGFloat iconX = 0;
        CGFloat iconY = 0;
        CGFloat iconW = 50;
        CGFloat iconH = 50;
//        self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
        self.iconImageViewFrame = CGRectMake(iconX, iconY, iconW, iconH);

        //2.2 计算nameLabelFrame值
        
#warning 宽度需要动态计算
        //最大宽度是200,高度就是20
        CGSize size = CGSizeMake(200, 20);
        NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        size = [self.name boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        CGFloat nameW = size.width;//150;
        CGFloat nameH = 20;
        CGFloat nameX = iconX + iconW;
        CGFloat nameY = (iconH - nameH) * 0.5; //相对于,icon居中显示
//        self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
        self.nameLabelFrame = CGRectMake(nameX, nameY, nameW, nameH);

        
        //2.3 vipFrame
        CGFloat vipW = 20;
        CGFloat vipH = 20;
        CGFloat vipX = nameX + nameW;
        CGFloat vipY = (nameH - vipH) * 0.5 + nameY;
        
        if(!self.vip)
        {
            vipW = 0;
            vipH = 0;
        }
//        self.vipImageView.frame = CGRectMake(vipX, vipY, vipW, vipH);
        self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);

        
        //2.4 contentTextLabelFrame
        CGFloat contentX = 0;
//        CGFloat contentY = CGRectGetMaxY(self.iconImageView.frame);//iconY + iconH;
         CGFloat contentY = CGRectGetMaxY(self.iconImageViewFrame);//iconY + iconH;
        CGFloat contentW = 375;
        
#warning 高度动态计算
        size = CGSizeMake(contentW, CGFLOAT_MAX);
        attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
        size = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        CGFloat contentH = size.height;
        
//        self.contentTextLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
        self.contentTextLabelFrame = CGRectMake(contentX, contentY, contentW, contentH);

        //2.5 pictureImageViewFrame
        CGFloat pictureX = 0;
        CGFloat pictureY = contentY + contentH;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
//        self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        //注意,只需要改变图片的宽度与高度为0即可,不要改变其坐标值
        //否则回到值,最后计算高度的时候,参考位置发生变化,出现错误
        if(self.picture == nil)
        {
//            pictureX = 0;
//            pictureY = contentY + contentH;
            pictureW = 0;
            pictureH = 0;
        }
        
        self.pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);

        
        //3.根据内容的变化,动态计算出cell的高度
        self.rowHeight = CGRectGetMaxY(self.pictureImageViewFrame) + 10;// pictureY + pictureH
        
        
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"text = %@,name = %@", _text,_name];
}

@end
