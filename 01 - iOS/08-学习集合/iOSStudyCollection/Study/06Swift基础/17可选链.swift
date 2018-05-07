//
//  17可选链.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/4.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal17: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         可选链：
         可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。
         如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。
         多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。
 */
        
        
        /** 使用可选链代替强制展开 */
        let person1 = Person()
        // person1.residence?返回可选类型，.numberOfRooms后也是可选的Int型
        if let roomCount = person1.residence?.numberOfRooms {
            print("有房间")
        } else {
            print("没有房间")
        }
        
        // 可选链调用属性，这里因为residence为nil，所也是调用失败的
        person1.residence?.numberOfRooms = 10
        
        // 可选链也可导致函数调用失败，这里不会调用函数
        person1.residence?.numberOfRooms = changeInt()
        
        // 可选链调用方法，someFunc虽然没有返回值，但如果调用失败会返回Void?，调用成功返回Void，所以可以用来判断
        if person1.residence?.someFunc() == nil {
            print("residence的函数调用失败")
        } else {
            print("residence的函数调用成功")
        }
        
        // 可选链调用下标
        if person1.residence?[100] == nil {
            print("下标调用失败")
        } else {
            print("下标调用成功")
        }
        
        // 其他更细节的用法见：http://www.swift51.com/swift4.0/chapter2/17_Optional_Chaining.html
    }
    
    func changeInt() -> Int {
        print("函数调用成功")
        return 10
    }
}



class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
    
    func someFunc() {
        print("函数调用成功")
    }
    
    subscript(index: Int) -> Int {
        return index
    }
}
