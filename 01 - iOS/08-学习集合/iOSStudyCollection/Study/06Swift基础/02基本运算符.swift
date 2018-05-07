//
//  Normal02.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/24.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal02: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /******************************************* 元组的比较 *******************************************/
        // 元素相同，长度相等的元组可以进行比较
        // 比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止
        print((1, "zebra") < (2, "apple"))
        print((3, "apple") < (3, "bird"))
        print((4, "dog") == (4, "dog"))
        
        
        
        
        /******************************************* 空合运算符 *******************************************/
        var a: Int?
        let b = a ?? 100      // a必须为可选类型，如果a存在值，则返回a的值，如果a不存在值，则返回100
        print(b)
        
        a = 99
        let c = a ?? 100
        print(c)
        
        
        
        /******************************************* 区间运算符 *******************************************/
        // 闭区间运算符
        for index in 1...5 {
            print(index, terminator: " ")
        }
        
        print("\n")
        
        // 半开区间运算符
        for index in 1..<5 {
            print(index, terminator: " ")
        }
        
        print("\n")
        
        // 单侧区间
        let names = ["zhaohe", "hezhao", "3", "4", "5"]
        for name in names[1...3] {
            print(name, terminator: " ")
        }
    }

}
