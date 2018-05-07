//
//  14构造过程.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/4.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal14: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = Class141(a: 20)
        let b = Class141(aa: 40)
        
        
        // 默认构造器
        let c = Class142()
        
        
        
        // 结构体的逐一构造器
        let d = Struct141(name: "zhaohe", sex: "male")
        
        
    }
}



class Class141 {
    var a: Double
    let b: String
    
    // 自定义构造过程
    init(a: Double) {
        self.a = a
        self.b = "name"        // 构造过程中，可以对常量进行修改，但一旦init之后，就无法再进行修改了
    }
    
    init(aa: Double) {
        self.a = aa
        self.b = "name"
    }
}



// 默认构造器，如果所有属性都有初始值，则会自动生成一个构造器，给所有属性附上初始值
class Class142 {
    var name = "赵赫"
    var sex: String?
}



// 结构体则会自动生成逐一构造器
struct Struct141 {
    var name: String
    var sex: String
}



// 值类型的构造器代理
struct Struct142 {
    var name: String
    var sex: String
    
    init(name: String, sex: String) {
        self.name = name
        self.sex = sex
    }
    
    init() {
        // 可以调用其他构造器来完成当前构造器的一些功能，减少构造器间的代码重复
        self.init(name: "zhao", sex: "sex")
    }
}






/******************** 类的继承与构造器（指定构造器、便利构造器、可失败构造器） ********************/
class Food {
    var name: String
    
    // 指定构造器
    init(name: String) {
        self.name = name
    }
    
    // 便利构造器：总是依赖其他指定构造器的构造器，可以快速的调用其他构造器来实现自身的构造过程
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

// 创建一个继承自Food的子类
class tomato: Food {
    var quantity: Int
    // 指定构造器
    init(name: String, quantity: Int) {
        self.quantity = quantity
        // 可以用父亲的构造器代理（继承过来的）
        super.init(name: name)
    }
    
    // 便利构造器（因为跟父类的构造器重名，所以这里是重写了父类的构造器，同时又被指定为便利构造器）
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

// 这里因为ShoppingListItem中新增的成员都有默认值，所以ShoppingListItem会自动继承父类的所有指定构造器和便利构造器
class ShoppingListItem: tomato {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}





/******************** 可失败构造器 ********************/
class Dog {
    var name: String
    
    // 可失败构造器允许在构造失败的情况下，return nil，来表示构造失败，返回一个nil
    init?(name: String) {
        if name.isEmpty {
            return nil
        } else {
            self.name = name
        }
    }
    
    // 类，结构体，枚举的可失败构造器可以横向代理到类型中的其他可失败构造器。类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。
    convenience init?(myName: String) {
        self.init(name: myName)       // 如果这里构造失败了，则init(myName:)这个方法也会构造失败
    }
}

// 子类可以重写父类的可失败构造器，init!会解包可失败构造器返回的可选类型实例，当然如果解包结果为nil，则会崩溃
class SmallDog: Dog {
    override init!(name: String) {
        super.init(name: name)
    }
}

// 枚举的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

// 如果是带原始值的枚举，则在通过原始值寻找对应成员的时候，找不到对应的成员会自动构造失败
enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}




/******************** 必要构造器 ********************/
class SomeClass {
    // required的构造器，子类必须实现该构造器
    required init() {
    }
}

class SubSomeClass: SomeClass {
    // 必要构造器在实现的时候，不需要写override
    required init() {
    }
    
    // !!!当然这个子类里的必要构造器可以不用重写，因为可以继承自父类，且完全满足构造器的构造要求，所以上面代码注释掉也没事
}





/******************** 通过闭包或函数 ********************/
// 如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值。
// 每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
class SomeNewClass {
    let someProperty: String = {
        // 在这个闭包中给 someProperty 创建一个默认值
        // someValue 必须和 SomeType 类型相同
        return "赵赫"
    }() // 注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。
    // 如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。
}
