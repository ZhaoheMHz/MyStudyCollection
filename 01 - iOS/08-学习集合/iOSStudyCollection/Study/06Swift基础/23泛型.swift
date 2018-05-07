//
//  23泛型.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/7.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal23: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var a = 10
        var b = 12
        changeSomeValue(a: &a, b: &b)
        print(a, b)
        
        
        // 泛型类型初始化
        let _ = Stack<String>()
    }
    
    
    
    // 泛型函数
    func changeSomeValue<T>(a: inout T, b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    
    
    // 泛型类型(模仿栈)
    struct Stack<Element> {
        var items = [Element]()
        mutating func push(_ item: Element) {
            items.append(item)
        }
        
        mutating func pop() -> Element {
            return items.removeLast()
        }
    }
}






/** 类型约束 */
// 可以约束泛型的类型或者遵守的协议
func Normal23SomeFunc<T: UIView, U: UITabBarDelegate>(a: T, b: U) {
    
}



/** 协议的关联类型 */
protocol Container {
    associatedtype ItemType     // 关联一个类型，这个类型由实现类来定义
    // 这里也可以规定类型的约束
//    associatedtype ItemType: Container
    
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

class Normal231: Container {
    // 规定类型
    typealias ItemType = Int
    func append(_ item: ItemType) {
    }
    var count: Int {
        return 10
    }
    subscript(i: Int) -> ItemType {
        return 0
    }
}


// where的类型限制
// 见：http://www.swift51.com/swift4.0/chapter2/23_Generics.html



// 下标泛型
