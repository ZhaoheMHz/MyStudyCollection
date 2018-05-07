//
//  GPMessage.m
//  01-即时通讯布局
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPMessage.h"

@implementation GPMessage

+(id)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
        
        //取出当前屏幕的宽度
        CGRect screen = [UIScreen mainScreen].bounds;
        
        //1.timeFrame
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = screen.size.width;
        CGFloat timeH = 20;
        self.timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
        
        CGFloat marginX = 10;
        //2.HeaderFrame
        CGFloat headerX = marginX;
        CGFloat headerY = CGRectGetMaxY(self.timeFrame);
        CGFloat headerW = 50;
        CGFloat headerH = 50;
        
        if(self.type == GPMessageTypeMe)
        {
            headerX = screen.size.width - headerW - marginX;
        }
        
        self.headerFrame = CGRectMake(headerX, headerY, headerW, headerH);
        
        //3.textFrame
        CGFloat textX = marginX + CGRectGetMaxX(self.headerFrame);

        
        CGFloat textY = headerY;
#warning 宽度与高度都必须是动态计算出来的
        
        //文字显示的最大宽度是多少,达到了最大的宽度限制,那么就需要折行显示
        CGFloat maxW = 200;
        
        CGSize size = CGSizeMake(maxW, CGFLOAT_MAX);
        NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
        size = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        CGFloat textW = size.width + 40;//200;
        CGFloat textH = size.height + 40;//20;
        
        if(self.type == GPMessageTypeMe)
        {
            textX = screen.size.width - headerW - marginX - textW;
        }
        
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        //4.rowHeight
        CGFloat maxHeader = CGRectGetMaxY(self.headerFrame);
        CGFloat maxText = CGRectGetMaxY(self.textFrame);
        self.rowHeight = MAX(maxText, maxHeader);
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"text = %@,time = %@",_text,_time];
}


@end
