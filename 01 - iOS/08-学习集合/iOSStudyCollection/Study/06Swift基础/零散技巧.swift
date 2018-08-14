//
//  零散技巧.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/7/26.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal24: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /******************************** 惰性求值 ********************************/
        let array = [1, 2, 4, 5, 3, 7]
        let element = array.lazy.map{ $0 * 2 }[3]       // 这样只会对下标为3的元素进行x2操作，而不是6个数都计算一遍
        print(element)
        
        
        
        
        /******************************** stride ********************************/
        let array1 = stride(from: 0, to: 10, by: 1).map {
            $0
        }
        let array2 = stride(from: 0, through: 10, by: 1).map {
            $0
        }
        print(array1)       // 打印[0, 1, 2 ... 9] from A to B，不包含B
        print(array2)       // 打印[0, 1, 2 ... 10] from A through B，包含B
        
        
        
        
        /******************************** static和class类方法 ********************************/
        // static和class这两个关键字都可以修饰类的方法，以表明这个方法是一个类方法。
        // 不过这两者稍微有一些区别：class修饰的类方法可以被子类重写，而static修饰的类方法则不能
        
        
        
        /******************************** Swift中的函数值 ********************************/
        let setInt: (Int, String) -> Void = UserDefaults.standard.set
        let getInt: (String) -> Int = UserDefaults.standard.integer
        
        setInt(10086, "key")
        print("存储的值：\(getInt("key"))")
        
        
        
        
        /******************************** Array判断是否contains没有实现Equatable的元素 ********************************/
        enum Animal {
            case dog
            case cat(Int)
        }
        
        let animals: [Animal] = [.dog, .dog, .cat(10)]
        let hasCat = animals.contains { animal in
            
            if case .cat(10) = animal {
                return true
            } else {
                return false
            }
        }
        print(hasCat)
        
        
        
        /******************************** flatMap会对可选值进行解包，并去除空值 ********************************/
        let arraySome: [Int?] = [1, 2, 3, 5, nil, 9]
        let result1: [Int] = arraySome.flatMap {
            $0
        }
        
        print(result1)        // [1, 2, 3, 5, 9]
        
        /** filter没有这种功能 */
        let result2 = arraySome.filter { element in
            element != nil
        }
        
        print(result2)        // [Optional(1), Optional(2), Optional(3), Optional(5), Optional(9)]
        
        
        
        /******************************** typealias泛型闭包 ********************************/
        typealias Block<U> = (U, U) -> Bool
        
        func compare<T: Comparable>(number1: T, number2: T, algorithm: Block<T>) -> Bool {
            return algorithm(number1, number2)
        }
        
        print(compare(number1: 10, number2: 20) {
            $0 < $1
        })
        
        
        
        
        
        /******************************** #keyPath ********************************/
        class Person: NSObject {
            dynamic var firstName: String = ""
            
            init(firstName: String) {
                self.firstName = firstName
            }
        }
        
        let chris = Person(firstName: "Chris")
        
        // #keyPath能保证keyPath的正确性
        chris.value(forKeyPath: #keyPath(Person.firstName))
        
        
        
        
        /******************************** AnyHashable ********************************/
        // 可以让任何实现了Hashable协议的类的实例作为dictionary的key
        let description: [AnyHashable: Any] = [
            AnyHashable("😄"): "emoji",
            AnyHashable(42): "an Int",
            AnyHashable(34.2): "a Double",
            AnyHashable(Set(["a", "b"])): "a set of strings"
        ]
        
        print(description[AnyHashable(42)]!)        // an Int
        print(description[AnyHashable(34)])         // nil
        print(description[AnyHashable(Set(["a", "b"]))]!)   // a set of strings
    }
}
