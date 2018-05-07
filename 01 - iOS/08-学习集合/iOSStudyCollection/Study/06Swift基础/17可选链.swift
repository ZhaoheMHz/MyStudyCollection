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
        
        
        /** 试用可选链代替强制展开 */
        
    }
    
}



class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
