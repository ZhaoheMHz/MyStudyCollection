//
//  08枚举.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/28.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal08: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** 获取枚举值 */
        var a = CompassPoint.north
        a = .north      // a可以被推断为CompassPoint类型，则可以这样简写
        
        
        
        /** 也可以通过switch来匹配值 */
        switch a {
        case .north:
            print("north")
        case .east:
            print("east")
        default:
            print("no")
        }
        
        
        
        
        /** 关联值 */
        var b = Barcode.upc(1, 2, 3, 4)
        b = Barcode.qrCode("01001001001010101")     // b同一时间只能储存一个关联值
        // 关联值可以被用来进行switch匹配
        switch b {
        case let .upc(A, B, C, D):
            print("abcd")
        case let .qrCode(A):
            print("a")
        default:
            print("default")
        }
        
        
        
        
        
        /** 获取原始值，通过rawValue来获取原始值 */
        print(CompassPoint2.east.rawValue)
        
        
        
        
        
        /** 对于有原始值的枚举类型，会有一个自动生成的构造器，改构造器通过原始值找到找到枚举成员，或者找不到返回nil */
        let c = CompassPoint2(rawValue: "north")        // 可以找到
        let d = CompassPoint2(rawValue: "northWest")    // 找不到，返回nil
        print(c, d)
    }

    
    // swift的枚举值本身就是一个完备的CompassPoint的值，不像OC一样，具有默认初始的Int值
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    // 也可以并列
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    // 关联值
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    // 原始值：所有原始值类型必须一致
    enum SomeEnum: String {
        case a = "a"
        case b = "b"
        case c = "c"
    }
    
    // 原始值的隐式赋值，这里因为mercury=1，所以后面一次+1
    enum Planet2: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    // 原始值的隐式赋值，这里因为没有告诉mercury=1，则默认mercury=0，后面依次类推
    enum Planet3: Int {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    // string的原始值，这里north的原始值就是“north”，后面依次类推
    enum CompassPoint2: String {
        case north
        case south
        case east
        case west
    }
    
    
    // 还有递归枚举，见：http://www.swift51.com/swift4.0/chapter2/08_Enumerations.html
}
