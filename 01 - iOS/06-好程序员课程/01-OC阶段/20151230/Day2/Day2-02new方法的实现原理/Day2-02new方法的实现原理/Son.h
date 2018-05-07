//
//  Son.h
//  Day2-02new方法的实现原理
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Soldier.h"

// Son -> Soldier -> NSObject
// [Soldier new]
// [Son new]
// 在一条继承链中，调用一个方法时，会先到接收者所在的类中去查找该方法的实现，如果没有实现，就会顺着继承关系，自下往上进行搜索，找到后，就执行相应的逻辑，如果到了继承链顶端，还没有发现方法的实现，程序崩溃
@interface Son : Soldier

@end








