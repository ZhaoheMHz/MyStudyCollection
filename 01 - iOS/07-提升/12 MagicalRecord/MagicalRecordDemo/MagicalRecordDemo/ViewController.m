//
//  ViewController.m
//  MagicalRecordDemo
//
//  Created by 赵赤赤 on 15/12/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <MagicalRecord/MagicalRecord.h>
#import <MagicalRecord/MagicalRecord+ShorthandMethods.h>
#import <MagicalRecord/MagicalRecordShorthandMethodAliases.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 新增
    Person *person = [Person MR_createEntity];
    person.firstname = @"赵";
    person.lastname = @"1111";
    person.age = @(24);
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    // 查询
    NSArray *personArr = [Person MR_findAll];
    for (Person *ppp in personArr) {
        NSLog(@"%@ %@ %zd", ppp.firstname, ppp.lastname, ppp.age);
    }
}

@end
