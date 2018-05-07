//
//  Student.h
//  A1CoreData
//
//  Created by 赵赤赤 on 15/9/22.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;

@end
