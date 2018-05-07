//
//  21扩展.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/7.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal21: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("name".toMD5String())
        
        
        var str = "zhaohe"
        str.appendNew("a")
        print(str)
        
        
        print("name"[2])
    }
    
}


/*
Swift 中的扩展可以：

添加计算型属性和计算型类型属性
定义实例方法和类型方法
提供新的构造器
定义下标
定义和使用新的嵌套类型
使一个已有类型符合某个协议
*/

extension String {
    
}

// 也可以为类遵守新的协议
extension String: ZHProtocol {
    
}

protocol ZHProtocol {
    
}

// 新增计算属性，但不能新增存储属性，也不能为已有属性添加属性观察器
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}




/** 扩展构造器 */
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}





/** 扩展方法 */
extension String {
    func toMD5String() -> String {
        return "转换后的md5string"
    }
    
    // mutating可以修改当前实例本身，结构体和枚举中，如果需要修改本身，需要声明为mutating
    mutating func appendNew(_ newElement: Character) {
        self.append(contentsOf: ["!", newElement])
    }
    
    // 下标
    subscript(index: Int) -> Int {
        return index
    }
    
    // 嵌套类型
    enum EnumSomeSome {
    
    }
}






