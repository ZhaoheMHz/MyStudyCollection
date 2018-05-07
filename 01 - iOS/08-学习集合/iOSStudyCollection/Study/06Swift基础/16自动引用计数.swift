//
//  16自动引用计数.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/4.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal16: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 弱引用：因为不会保持引用的实例，所以实例在释放的时候，弱引用可能指向nil，所以需要用var来声明
        weak var a = Class161()
        
        // 无主引用，无主引用通常被期望是有值的，而且一旦新创建的Class161实例释放掉后，b不会被arc赋值为nil，因为unowned声明的变量是非可选的
        // 所以无主引用要保证和指向的实例的生命周期保持一致
        unowned var b = Class161()
        
        // 不安全的无主引用，如果指向的实例释放了，这时候去访问c，回去找之前指向的实例所在的内存地址，这时访问就是空指针了
        unowned(unsafe) var c = Class161()
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            // 这里打印a，a会识别为nil
            print(a)
            
            // 这里如果去打印b，则b因为是unowned的，b现在指向的实例已经释放了，所以会崩溃，提示所指向的实例已经释放了
//            print(b)
            
            // 不安全的无主引用，因为内存释放掉了，这里就空指针Bad_Access了
//            print(c)
        }
    }
}


class Class161 {
}






/********************** 闭包捕获列表 ********************/
class Class162 {
    var name: String?
    
    lazy var aClosure: ()->Void = {
        // 当aClosure被调用后会初始化为这个闭包，当前实例持有闭包，闭包持有self，循环引用了
        self.name = "100"
    }
    
    // 可以通过定义捕获列表来解决强引用的问题
    // 捕获列表定义了闭包体内捕获一个或者多个引用类型的规则
    lazy var bClosure: ()->Void = { [weak self, weak _ws = self, unowned _us = self] in     // 捕获列表支持多重命名方式
        self!.name = "100"
        _ws?.name = "200"
        _us.name = "300"
    }
    
    // 以上的例子，闭包伴随着实例的init和deinit，则闭包对self的引用，可以使用unowned来引用，可以避免weak的解包过程
}


