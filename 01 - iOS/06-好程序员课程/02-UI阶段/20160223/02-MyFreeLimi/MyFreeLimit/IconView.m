//
//  IconView.m
//  LimitFree
//
//  Created by yang on 20/12/13.
//  Copyright (c) 2013 北京千锋互联科技有限公司. All rights reserved.
//

#import "IconView.h"
#import "UIView+QFExt.h"
#import "QFDevice.h"

#import "UIImageView+AFNetworking.h"

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation IconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 创建局部的视图...
        CGRect rect1 = CGRectMake(8, 8, self.width-2*8, self.width-2*8);
        
        iconImage = [[UIImageView alloc] initWithFrame:rect1];
        //iconImage.backgroundColor = [UIColor blueColor];
        [iconImage makeCorner:10];
        [self addSubview:iconImage];
        
        
        float lHeight = 15;
        
        CGRect rect2 = CGRectMake(0 + 10, self.height-lHeight+2, self.width, lHeight);
        label = [[UILabel alloc] initWithFrame:rect2];
        [label setFont:SysFont(12)];
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
    }
    return self;
}
- (void) setModel:(AppModel *)model {
    _model = model;
    
    [iconImage setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    [label setText:model.name];
}

- (void)  addTarget:(id)target withAction:(SEL)sel {
    _target = target;
    _sel = sel;
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [_target performSelector:_sel withObject:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
