//
//  GPStatusesCell.m
//  01-微博图文
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPStatusesCell.h"

@interface GPStatusesCell()

@property (nonatomic, weak)UIImageView * iconImageView;
@property (nonatomic, weak)UILabel * nameLabel;
@property (nonatomic, weak)UIImageView * vipImageView;
@property (nonatomic, weak)UILabel * contentTextLabel;
@property (nonatomic, weak)UIImageView * pictureImageView;


@end

@implementation GPStatusesCell

+(id)statusesCellWithTableView:(UITableView *)tableView
{
    /*
    //? 使用nib创建的时候,重用cell,只需要注册,然后在缓存池中取就可以了
    //那么使用纯代码的方式,就不能够使用注册机制吗?
    NSString * Identifier = NSStringFromClass([self class]);
    GPStatusesCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    return cell;
     */
    //ios6之后使用注册机制完成cell的重用
    NSString * className = NSStringFromClass([self class]);
    //1.注册 registerClass 你想要重用的cell类型 [self class]获得的就是(GPStatusesCell 类型)
    [tableView registerClass:[self class]forCellReuseIdentifier:className];
    //2.缓存池中取cell对象,如果没有可重用的对象,那么就根据注册的类型创建一个可重用的cell对象返回
    return [tableView dequeueReusableCellWithIdentifier:className];
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        //1.头像 icon
        UIImageView * iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        //2.名称 name
        UILabel * nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        nameLabel.font = [UIFont systemFontOfSize:13];
        
        //3.是否是 vip
        UIImageView * vipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        //4.文字内容 text
        UILabel * contentTextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:contentTextLabel];
        self.contentTextLabel = contentTextLabel;
        
        //动态计算高度需要设置的两个属性
        //文字大小要与,动态计算高度时参考的文字大小统一
        contentTextLabel.font = [UIFont systemFontOfSize:15];
        contentTextLabel.numberOfLines = 0;
        
        //5.配图 picture
        UIImageView * pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
    }//end if
    
    return self;
    
}//end method

- (void)setStatuses:(GPStatuses *)statuses
{
    _statuses = statuses;
    
    //1.填充数据
    self.iconImageView.image = [UIImage imageNamed:statuses.icon];
    self.nameLabel.text = statuses.name;
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    self.contentTextLabel.text = statuses.text;
    self.pictureImageView.image = [UIImage imageNamed:statuses.picture];
    
    //更新所有子控件Frame值
    self.iconImageView.frame = statuses.iconImageViewFrame;
    self.nameLabel.frame = statuses.nameLabelFrame;
    self.vipImageView.frame = statuses.vipFrame;
    self.contentTextLabel.frame = statuses.contentTextLabelFrame;
    self.pictureImageView.frame = statuses.pictureImageViewFrame;
    
    /*
    //2.根据内容的变化,动态的计算组件的Frame值
    
    //2.1 计算iconImageViewFrame值
    CGFloat iconX = 0;
    CGFloat iconY = 0;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    //2.2 计算nameLabelFrame值
    
#warning 宽度需要动态计算
    //最大宽度是200,高度就是20
    CGSize size = CGSizeMake(200, 20);
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    size = [statuses.name boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGFloat nameW = size.width;//150;
    CGFloat nameH = 20;
    CGFloat nameX = iconX + iconW;
    CGFloat nameY = (iconH - nameH) * 0.5; //相对于,icon居中显示
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //2.3 vipFrame
    CGFloat vipW = 20;
    CGFloat vipH = 20;
    CGFloat vipX = nameX + nameW;
    CGFloat vipY = (nameH - vipH) * 0.5 + nameY;
   
    
    self.vipImageView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    
    //2.4 contentTextLabelFrame
    CGFloat contentX = 0;
    CGFloat contentY = CGRectGetMaxY(self.iconImageView.frame);//iconY + iconH;
    CGFloat contentW = 375;
    
#warning 高度动态计算
    size = CGSizeMake(contentW, CGFLOAT_MAX);
    attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    size = [statuses.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGFloat contentH = size.height;

    self.contentTextLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
    
    //2.5 pictureImageViewFrame
    CGFloat pictureX = 0;
    CGFloat pictureY = contentY + contentH;
    CGFloat pictureW = 100;
    CGFloat pictureH = 100;
    self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    //3.根据内容的变化,动态计算出cell的高度
    self.rowHeight = CGRectGetMaxY(self.pictureImageView.frame);
    */
}

@end
