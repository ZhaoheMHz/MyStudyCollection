//
//  DetailViewController.h
//  A1fmdb
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@protocol DetailViewControllerDelegate <NSObject>

- (void)detailInserWithModel:(Person *)ps;

@end


@interface DetailViewController : UIViewController

@property (nonatomic, assign) int row;
@property (nonatomic, strong) Person *ps;
@property (nonatomic, assign) id<DetailViewControllerDelegate> delegate;

@end
