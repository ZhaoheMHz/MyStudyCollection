//
//  11方法.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/3.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal11: UIViewController {

    var name: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // self属性等于当前实例本身
        self.someFunc()
        
        // 当然self也可以省略，swift会自动推断是当前实例在调用方法
        someFunc()
        
        // 调用类型方法
        Normal11.classFunc()
    }

    // 实例方法
    func someFunc() {
        self.name = 1
    }
    
    //类型方法
    static func classFunc() {
        
    }
    
    // 子类可重写的类型方法
    class func classFunc2() {
        
    }
}




struct Struct111 {
    var a = 1
    var b = 2
    func changeAB() {
        // 这样是不被允许的，因为Struc是值类型的，默认当前self是不可变的
//        self.a = 5
//        self.b = 6
    }
    
    // 这样就可以内部修改属性了，这里会给隐含的给self一个新的实例，新实例在修改了内部属性后，替换原来的self，达到内部修改属性的效果
    mutating func changeABAnother() {
        self.a = 5
        self.b = 6
    }
    
    // 因为可变方法可以给self赋新值，所以也可以重新给self实例化
    mutating func newStruct() {
        self = Struct111(a: self.a + 10, b: self.b + 11)
    }
}
