//
//  01基础部分.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/24.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class NormalClass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /******************************************* 常量与变量 *******************************************/
        /** 可以在一行中声明多个常量或者多个变量，用逗号隔开 */
        let a = 1, b = "c", c = 10
        
        
        
        /** 类型标注 */
        var str: String
        str = "zhaohe"
        
        
        /** 都好分割生成多个指定类型的变量 */
        var str1, str2, str3: String
        
        
        /** 打印 */
        var str4 = "str"
        var str5 = "str2"
        print(str)
        
        // 打印支持其他参数，因为这些参数有默认值，所以不明确的写出来也可以
        print(str4, str5, separator: "--", terminator: "zhaohe\n") // separator将前面的多个参数分隔开，terminator会在结尾追加
        
        // 字符串插值
        var str6 = "str3"
        print("这是\(str4)这是\(str5)这是\(str6)")
        
        /* 代码代码/* 注释注释 */ 代码代码*/        // swift允许注释嵌套注释，这样一大段代码，不管里面有多少代码或者注释，也可以直接在外面嵌套一层注释，直接把一大段注释掉
        
        
        
        
        
        
        
        
        /******************************************* 数据类型 *******************************************/
        // 通过类型的min、max属性，可以查看该类型支持的最小值、最大值
        print(Int8.min, Int8.max)
        // Int在32位机器上是Int32，在64位机器上是Int64
        // UInt代表无符号整形
        // Float位32位浮点，Double位64位浮点
        
        // 类型推断，不浮点数不指定类型，就会自动推断为Double
        let number = 3+3.14
        
        // 进制表示
        /**
         一个十进制数，没有前缀
         一个二进制数，前缀是0b
         一个八进制数，前缀是0o
         一个十六进制数，前缀是0x
         */
        let decimalInteger = 17
        let binaryInteger = 0b10001       // 二进制的17
        let octalInteger = 0o21           // 八进制的17
        let hexadecimalInteger = 0x11     // 十六进制的17
        
        //let aNum: Int8 = -2000
        // 这里会报错，因为Int8存储不了这么大的数字
        
        /** 类型别名 */
        typealias ZHString = String
        let zhStr: ZHString = "赵赫"
        
        // 给闭包设置别名
        typealias aClosure = (Int, Int) -> (Int)
        var aaa: aClosure = {(a, b) -> (Int) in
            return a+b
        }
        print(aaa(10, 5))
        
        /** Bool */
        let trueB: Bool = true
        let falseB: Bool = false
        
        
        
        /** 元组，把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。 */
        // (Int, String)
        let aTuple = (404, "Not Found")
        // 元组分解
        let (num404, nfStr) = aTuple
        print(num404, nfStr)
        // 只需取出部分的时候，可以用 _ 来省略
        let (num404a, _) = aTuple
        print(num404a)
        // 下表直接取
        print(aTuple.0)
        // 也可以直接给元素明明
        let bTuple = (aNum: 404, aStr: "Not Found")
        print(bTuple.aNum)
        
        
        
        
        
        
        
        
        /******************************************* 可选类型 *******************************************/
        let aWord: String = "123"
        // 则aTFNum被推断为Int？，或optional Int，因为如果aWord是"Hello"，则会出现转换失败无法得到Int值得情况
        let aTFNum = Int(aWord)
        
        // 声明可选类型时，默认值都是nil，也可以显式的给可选类型变量赋值nil
        var myName: String?
        myName = nil
        // swift中的nil是一个特定的值，表示缺失值，而不是oc中的一个指向空对象的指针
        
        /** if语句与强制解析 */
        var mymyName: String?
        mymyName = "zhaohe"
        if mymyName != nil {    // 通过 != nil 来判断可选类型是否有值
            print("可选类型有值\(mymyName!)")     // 确定mymyName一定有值后，可以用 ! 来强制解析
        }
        
        /** 可选绑定 */
        // 可选绑定用于会判断可选类型是否包含值，包含值的话，会把值赋给一个临时变量以供使用
        var zhaoheName: String?
        //zhaoheName = "zhaohe"
        if let zhaohe = zhaoheName {
            print(zhaohe)
        } else {
            print("没有值")
        }
        
        
        
        
        
        
        
        
        
        
        /******************************************* 断言 *******************************************/
        //assert(1==1, "断言了")
        //assertionFailure("直接断言了")
        
        /** 先决条件 */
        //let aNumNum = 6
        //precondition(aNumNum<5, "条件不足")     // 判断为false的时候，则识别为，不满足先决条件，代码无法执行
    }

}
