//
//  03字符串和字符.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/24.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal03: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /******************************************* 多行字符串 *******************************************/
        let str = """
你好啊
你干啥呢
来玩啊
"""
        print(str)
        
        
        
        
        
        /******************************************* 初始化 *******************************************/
        let str1 = ""
        let str2 = String()
        print(str1 == str2)     // 两种初始化方式是相等的
        if str1.isEmpty {
            print("emptyStr")
        }
        
        // 字符数组创建字符串
        let str3: [Character] = ["a", "b", "c"]
        print(String(str3))
        
        
        
        
        
        /******************************************* 一些用法 *******************************************/
        /**
         Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝
         */
        
        /** for循环遍历字符串 */
        for c in "zhaohe" {
            print(c, terminator: " ")
        }
        print("\n")
        
        /** 长度 */
        print("zhaohe".count)
        
        /** 字符串索引 */
        let myName = "zhaohe"
        print(myName[myName.startIndex])
        print(myName[myName.index(before: myName.endIndex)])    // endIndex是字符串最后一个字符的index+1
        
        /** 返回所有下标 */
        for index in myName.indices {
            print(myName[index]);
        }
        
        /** 插入和删除 */
        var myNameName = "iOS"
        print(myNameName)
        myNameName.insert(contentsOf: "赵赫", at: myNameName.endIndex)
        print(myNameName)
        myNameName.removeLast()
        print(myNameName)
        
        /** 子字符串 Substring */
        let substring = myNameName.prefix(through: myNameName.index(of: "赵")!)
        // 这里substring是Substring类型的
        print(substring)
        // Substring使用的内存是原String的内存，所以如果原String不存在了，则Substring也不存在了，所以如果需要长期使用Substring，需要转换为String类型
        print("转换后：\(String(substring))")
        
        /** 字符串的比较 == != */
        let str4 = "赵赫"
        let str5 = "赵赫"
        if str4 == str5 {
            print("字符串相等")
        }
        
        /** 判断前缀、后缀 */
        let str6 = "123456"
        print(str6.hasPrefix("1"), str6.hasSuffix("6"))
    }
    
    
    
    
    

}
