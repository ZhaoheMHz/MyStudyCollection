//
//  GPSubjectCell.m
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPSubjectCell.h"

@interface GPSubjectCell ()


@end

@implementation GPSubjectCell

+(id)subjectCellWithTableView:(UITableView *)tableView
{
    //1.使用loadNibNamed加载cell
    //不能够进行复用
//    GPSubjectCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"GPSubjectCell" owner:nil options:nil] lastObject];
    
    /*
    GPSubjectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"subjectCell"];
    if(cell == nil){
        //2.使用UINib加载cell对象
        //如果xib文件使用频率比较高,建议使用UINib类进行加载
        //必须在xib文件中加入重用标识才可以
        UINib * nib =  [UINib nibWithNibName:@"GPSubjectCell" bundle:nil];
        NSArray * objArray = [nib instantiateWithOwner:nil options:nil];
        cell = [objArray lastObject];
    }
     */
    
    //ios 6.x 之后建议我们使用注册机制进行cell的重用
    UINib * nib =  [UINib nibWithNibName:@"GPSubjectCell" bundle:nil];
    //注册一下 需要进行重用的xib对象
    [tableView registerNib:nib forCellReuseIdentifier:@"subjectCell"];
    
    //1.如果缓存池中,没有可重用的cell对象,那么他会自己创建一个cell对象返回来
    GPSubjectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"subjectCell"];
    
    return cell;
}

- (void)setSubject:(GPSubject *)subject
{
    _subject = subject;
    
    //更新子控件内容
    self.iconImageView.image = [UIImage imageNamed:subject.icon];
    self.titleLabel.text = subject.title;
    self.cardNumberLabel.text = subject.cardNumber;
    self.nodeLabel.text = subject.note;

}

@end
