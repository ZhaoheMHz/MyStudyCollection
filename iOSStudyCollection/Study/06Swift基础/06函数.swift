//
//  06函数.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/26.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal06: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.greet(name: "赵赫"))
        print(function1())
        print(function2())
        self.greet2(name: "赵赫", from: "china", "heilongjiang")
        self.add(a: 1, b: 2)
        self.add(nums: 1,2,3,4,5)
        
        var str = "1"
        self.changeStr(str: &str)
        print(str)
        
        // 函数类型
        let addFuncInstead: (Int, Int)->Int = addFunc(a:b:)
        print(addFuncInstead(1, 2))
        
        // 调用参数包含函数类型的函数
        print(self.addFunc2(addFunc: addFuncInstead, a: 100, b: 20))
        
        // 函数作为返回值，嵌套函数详见 http://www.swift51.com/swift4.0/chapter2/06_Functions.html
    }
    
    
    // 函数
    func greet(name: String) -> String {
        let greeting = "greeting \(name)"
        return greeting
    }
    
    
    // 返回元组
    func function1() -> (a: String, b: String) {
        return ("赵赫", "iOS")
    }
    
    // 返回可选的元组
    func function2() -> (a: String, b: String)? {
        return nil;
    }
    
    // 参数标签， 参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言（这样跟像OC的函数名）， 可以用_进行省略
    func greet2(name: String, from location: String, _ info: String) {
        print("\(name), \(location), \(info)")
    }
    
    // 参数默认值，可以给参数一个默认值，当不传这个参数的值得时候，默认值会生效
    func add(a: Int, b: Int, c: Int = 5) {
        print(a, b, c)
    }
    
    // 可变参数，一个函数最多可以有一个可变参数，可变参数实际上会变成一个数组
    func add(nums: Double...) {
        print(nums)
    }
    
    // 输入输出参数，调用时传入的参数需要&修饰
    func changeStr(str: inout String) -> String {
        str = "2"
        return str
    }
    
    
    
    // 函数类型， 该函数的类型为(Int, Int) -> Int
    func addFunc(a: Int, b: Int) -> Int {
        return a+b
    }
    
    
    // 函数作为参数
    func addFunc2(addFunc: (Int, Int) -> Int, a: Int, b: Int) -> Int {
        return addFunc(a, b)
    }
}
