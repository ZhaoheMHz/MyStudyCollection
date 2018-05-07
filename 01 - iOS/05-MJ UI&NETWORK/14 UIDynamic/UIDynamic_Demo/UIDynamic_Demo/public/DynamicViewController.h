//
//  DynamicViewController.h
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum{
    
    DynamicTypeGravity = 0,
    DynamicTypeSnap,
    DynamicTypePush,
    DynamicTypeAttchment,
    DynamicTypeSpring,
    DynamicTypeCollision
    
}DynamicType;

@interface DynamicViewController : UIViewController

@property (assign, nonatomic) DynamicType type;

@end
