//
//  ModelCell.m
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/23.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ModelCell.h"

@interface ModelCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starView;

@end

@implementation ModelCell

- (void)loadModel:(Model *)model {
    self.nameLabel.text = model.name;
    self.infoLabel.text = model.info;
    
    // 设置五角星图片的左对齐及裁剪
    self.starView.contentMode = UIViewContentModeLeft;
    self.starView.clipsToBounds = YES;
    // 设置五角星
    CGRect frame = self.starView.frame;
    frame.size.width = 65/5*model.star.intValue;
    self.starView.frame = frame;
}

- (void)awakeFromNib {
    self.infoLabel.textColor = [UIColor grayColor];
}

@end
