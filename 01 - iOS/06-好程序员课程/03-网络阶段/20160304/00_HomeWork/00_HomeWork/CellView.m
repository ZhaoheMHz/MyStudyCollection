//
//  CellView.m
//  00_HomeWork
//
//  Created by baoxu on 15/11/27.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "CellView.h"

@implementation CellView

//重写初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeCellView];
    }
    
    return self;
}


-(void)makeCellView{

    self.cellImageView = [[UIImageView alloc]initWithFrame:CGRectMake(270, 10, 80, 80)];
    [self.contentView addSubview:self.cellImageView];
    
    self.defaultImage = [UIImage imageNamed:@"photo_placeholder"];
    self.cellImageView.image = self.defaultImage;
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 80, 30)];
    [self.contentView addSubview:self.titleLabel];
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(90, 50, 180, 0)];
    [self.contentView addSubview:self.progressView];
    self.progressView.hidden = YES;
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
