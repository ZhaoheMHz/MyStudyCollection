//
//  CategoryViewController.h
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

//需要传输分类的category_id到Common界面上

@protocol CategoryDelegate <NSObject>

-(void)changeCategoryId:(NSString *)idString;

@end


@interface CategoryViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (assign) id<CategoryDelegate> delegate;

@property (copy,nonatomic) void (^changeCategory)(NSString *categoryId) ;

@end
