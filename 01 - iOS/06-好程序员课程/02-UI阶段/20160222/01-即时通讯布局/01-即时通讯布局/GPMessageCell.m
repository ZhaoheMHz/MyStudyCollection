//
//  GPMessageCell.m
//  01-即时通讯布局
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPMessageCell.h"

@interface GPMessageCell()

@property (nonatomic, weak)UILabel * timeLabel;
@property (nonatomic, weak)UIButton * headerButton;
@property (nonatomic, weak)UIButton * textButton;

@end

@implementation GPMessageCell

+(id)messageCellWithTableView:(UITableView *)tableView
{
    NSString * className = NSStringFromClass([self class]);
    [tableView registerClass:[self class] forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //1.time
        UILabel * timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:13];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel = timeLabel;
        
        //2.header
        UIButton * headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:headerButton];
        self.headerButton = headerButton;
        
        //3.text
        UIButton * textButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:textButton];
        self.textButton = textButton;
        
        [textButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //UIButton中的文字内容折行设置
        textButton.titleLabel.numberOfLines = 0;
        textButton.titleLabel.font = [UIFont systemFontOfSize:15];
//        textButton.backgroundColor = [UIColor yellowColor];\
        
        textButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        
    }
    return self;
}

- (void)setMessage:(GPMessage *)message
{
    _message = message;
    
    //1.更新数据
    self.timeLabel.text = message.time;

    [self.textButton setTitle:message.text forState:UIControlStateNormal];
    if(message.type == GPMessageTypeMe){
        
        [self.headerButton setBackgroundImage:[UIImage imageNamed:@"me"] forState:UIControlStateNormal];
        
        UIImage * image = [UIImage imageNamed:@"chat_send_nor"];
        /*
        //UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
        CGFloat top = image.size.height * 0.5;
        CGFloat left = image.size.width * 0.5;
        CGFloat bottom = top;
        CGFloat right = left;
        
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right)];
        */
        
        
        [self.textButton setBackgroundImage:[self resizeImage:image] forState:UIControlStateNormal];
    }
    else
    {
        [self.headerButton setBackgroundImage:[UIImage imageNamed:@"other"] forState:UIControlStateNormal];
        
    
        UIImage * image = [UIImage imageNamed:@"chat_recive_press_pic"];

        [self.textButton setBackgroundImage:[self resizeImage:image] forState:UIControlStateNormal];
    }
    
    //2.更新Frame值,Frame值是动态发生改变的所以应该在模型封装的时候进行计算
    self.timeLabel.frame = message.timeFrame;
    self.headerButton.frame = message.headerFrame;
    self.textButton.frame = message.textFrame;
}

- (UIImage *)resizeImage:(UIImage *) image
{
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = top;
    CGFloat right = left;
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right)];
    
    return image;
}

@end
