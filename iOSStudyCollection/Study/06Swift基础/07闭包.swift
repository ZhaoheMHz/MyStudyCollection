//
//  07闭包.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/27.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal07: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /** 用函数排序 */
        let name: [String] = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(name.sorted(by: backward))
        
        
        
        /** 用闭包排序，闭包的参数可以为可变参数，但一定要放在最后一位，否则会报错 */
        print(name.sorted(by: { (s1, s2) -> Bool in return s1<s2}))    // 这里闭包只有return，则可以都写在一行里面
        
        // 上下文可以推断出闭包的返回值类型，则可以直接省略返回值的书写
        print(name.sorted(by: {s1, s2 in return s1<s2}))
        
        // 写在一行的时候，return也可以省略
        print(name.sorted(by: {s1, s2 in s1<s2}))
        
        // 这里因为只有一行，可以推断出这一行就是返回值，同时可用$0代表第一个参数，$1代表第二个参数，省略参数名的书写
        print(name.sorted(by: {$0 < $1}))
        
        // Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值
        print(name.sorted(by: < ))
        
        
        
        /** 尾随闭包，闭包作为一个函数的最后一个参数使用时，可以直接直接省略参数，用{} 跟随在函数后面就行 */
        print(name.sorted() {
            $0 < $1
        })
        // 闭包作为唯一参数，也可以省略方法调用的()
        print(name.sorted{$0 < $1})
        
        // Array的map方法
        print(name.map{ element -> String in return element.uppercased()})
        
        
        /** 闭包是引用类型 */
        
        
        
        
        /** 逃逸闭包 */
        self.delayFunc { () -> Int in
            return 10
        }
        
        
        
        /** 自动闭包 */
//        1:自动闭包，顾名思义是一种自动创建的闭包，用于包装函数参数的表达式，可以说是一种简便语法.
//        2:自动闭包不接受任何参数，被调用时会返回被包装在其中的表达式的值。
//        3:自动闭包的好处之二是让你能够延迟求值,因为代码段不会被执行直到你调用这个闭包，这样你就可以控制代码什么时候执行。
//        4：含有autoclosure特性的声明同时也具有noescape的特性，及默认是非逃逸闭包，除非传递可选参数escaping.如果传递了该参数，那么将可以在闭包之外进行操作闭包,形式为：请使用@autoclosure(escaping)。
        self.autoClosur(1<2)
    }
    
    func backward(s1: String, s2: String) -> Bool {
        return s1<s2
    }
    
    // 允许闭包在函数return之后也有引用，可以脱离函数继续执行
    // 用@escaping来明确闭包是可以逃逸的，否则默认都是非逃逸的
    func delayFunc(closure: @escaping () -> Int ) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            print(closure())
        }
    }
    
    func autoClosur(_ comp: @autoclosure ()->Bool) {
        if comp() {
            print("True")
        }
    }
}
