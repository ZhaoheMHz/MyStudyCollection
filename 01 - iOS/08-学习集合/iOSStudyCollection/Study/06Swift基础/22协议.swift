//
//  22协议.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/7.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal22: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}


// 父类写在前面，协议写在后面
class Normal222: UIView, StringProtocolString {
    var mustBeSettable: Int {
        get {
            return 10
        }
        set {
            
        }}
    var doesNotNeedToBeSettable: Int {return 10}
    static var someTypeProperty: Int {
        get {
            return 10
        }
        set {
            
        }}
    
    func SomeFun() {
        
    }
    
    // 实现代理中的构造器，必须用required
    required init(somePara: Int) {
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

protocol StringProtocolString {
    // 提供属性
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    // 类型属性
    static var someTypeProperty: Int { get set }
    
    // 方法（针对值类型需要修改self的需求）
    mutating func SomeFun()
    
    // 构造器
    init(somePara: Int)
}

// 通过扩展遵循协议
extension Normal222: StringProtocolStringSub {}


// 协议可以继承
protocol StringProtocolStringSub: StringProtocolString {
}

// 类类型专属协议，这样只有类才能遵守
protocol SomeClassProtocol: class {
}




/** 协议合成 */
class Normal223: SomeClassProtocol, SomeClassProtocol2 {
    
}

protocol SomeClassProtocol2: class {
}

// 这里用&来合并多个协议
func normal22Func(inPara: SomeClassProtocol & SomeClassProtocol2) {
    
}





// is as
// is判断是否遵循了某个协议，as来直接转换，同类的转型一致





/** 可选的协议 */
// 方案一：通过转化为Objc方法
@objc protocol ObjecProtocol {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Normal224: ObjecProtocol {
}

// 方案二：通过扩展给协议添加默认实现
protocol Normal2222222Protocol {
    func requiredFunc()
    func optionalFunc()
}

extension Normal2222222Protocol {
    func optionalFunc() {
        print("默认实现")
    }
}
// 这样，扩展中的方法就不需要必须实现了
class Normal2222222ProtocolClass: Normal2222222Protocol {
    func requiredFunc() {
    }
}





// 协议扩展，可为协议提供一些方法实现，而无需在每个遵循协议的地方都实现一遍
protocol Normal225Protocol {
    func someFunc()
}

extension Normal225Protocol {
    // 可以为协议添加新的方法及实现
    func someFunc2() {
        print("新增了方法")
    }
    
    // 也可以为协议已经定义的接口添加实现
    func someFunc() {
        print("实现了方法")
    }
}



// 为协议扩展添加限制条件
// 只有Collection.Iterator.Element实现了Normal225Protocol协议，才能获得调用extension实现的方法
extension Collection where Iterator.Element: Normal225Protocol {
}
