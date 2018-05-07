//
//  13继承.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/3.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal13: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // 禁止子类重写
    final func someFunc() {
        
    }
    
}

class SubNormal13: Normal13 {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // 重写父类final修饰的方法，会报错
//    override func someFunc() {
//
//    }
}


// final修饰的类，无法被其他类继承
final class NoOverrideClass {
    
}



// swift类不都是继承自一个通用基类的（比如OC的NSObject），下面的NewClass，就是一个基类
class NewClass {
    
}
