//
//  10属性.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/3.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal10: UIViewController {

    // 存储属性
    var a = 10
    var b = "zhao"
    
    
    
    // 延迟存储属性
    lazy var c = 10
    lazy var d = "zhaohe"
    
    
    
    // 计算属性，有get、set方法的
    var e: String {
        get {
            return "zhaohe"
        }
        
        /** set有多种写法 */
        set(name) {
            print(name)
        }
        
        // 省略set参数名，默认参数名为newVale
//        set {
//            print(newValue)
//        }
    }
    
    
    
    // 只读计算属性，只有get方法的属性是只读的
    var f: String {
//        get {
//            return "赵赫"
//        }
        
        // 简写
        return "赵赫"
    }
    
    
    
    // 典型的oc式set/get方法
    var _name: String?
    var name: String? {
        get {
            return _name
        }
        
        set {
//            对newValue.做一些操作
            _name = newValue
        }
    }
    
    
    
    // 属性观察器
    var sex: String? {
        willSet {
            print("willSet: \(newValue!)")
        }
        
        didSet {
            print("didSet: \(sex!)")
        }
    }
    

    
    // 类型属性(静态属性)
    static var gender: String?
    class var newGender: String? {
        return "男"
    }   // 用class来声明一个类型属性，也是类名调用，但子类可以直接重写
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 只读的f，在赋值时会报错
//        self.f = "赵"
        
        
        // 属性观察期
        self.sex = "男"
        self.sex = "女"
        
        
        
        // 类型属性，通过类名调用
        print(Normal10.gender)
        print(Normal10.newGender)
    }
    
}



class SubNormal10: Normal10 {
    // 子类可以通过class来重写类型属性
    var newGender: String? {
        return "女"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}




// 全局属性，直接写在外面就ok，也不需要什么特殊的修饰
let myName = "赵赫"
var mySex: String?





// 通过闭包和函数设置属性默认值，见14构造过程
