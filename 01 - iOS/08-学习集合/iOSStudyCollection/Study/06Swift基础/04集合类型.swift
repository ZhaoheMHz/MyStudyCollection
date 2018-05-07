//
//  04集合类型.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/25.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal04: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /************************************* 数组 *************************************/
        /** 创建空数组 */
        var someInt = [Int]()
        someInt.append(1)
        print(someInt)
        
        // 置空，因为上面已经知道数组存放的是Int类型了，所以就就可以省略Int了
        someInt = []
        
        
        /** 创建具有默认值的数组 */
        let newArr = Array(repeating: "赵赫", count: 4)
        print(newArr)
        
        
        /** 合并两个数组 */
        let newArr2 = Array(repeating: "mhz", count: 3)
        print(newArr+newArr2)
        
        
        /** 字面量创建数组 */
        var arr1 = ["0", "1"]
        print(arr1)
        
        
        /** 一些基础用法 */
        print(arr1.count)   // arr的数量
        print(arr1.isEmpty) // 是否为空
        arr1.append("2")    // 添加新的元素
        print(arr1)
        arr1+=["3"]         // 与其他数组相加
        print(arr1)
        print(arr1[0])      // 下标取元素
        arr1[0] = "-1"      // 下标赋值
        print(arr1[0])
        print(arr1[0...2])  // 取区间值
        
        
        /** 数组的遍历 */
        for (index, value) in arr1.enumerated() {
            print("\(index):\(value)")
        }
        
        
        
        /************************************* 集合 *************************************/
        /** 初始化 */
        var set1 = Set<Int>()    // Set的初始化没有简写
        print(set1)
        set1.insert(2)  // 插入一个值
        print(set1)
        set1 = []   // 清空
        print(set1)
        
        // 字面量初始化
        var set2: Set<String> = ["Tom", "Jack", "Nick"]
        let set3: Set = ["Mary", "Sam", "Luck"]     // 因为set无法从字面量直接识别出来，所以需要显示的声明为set类型
        print(set2, set3)
        
        /** 一些基础用法 */
        print(set2.count)       // 元素数量
        print(set2.isEmpty)     // 是否为空
        set2.insert("Micheal")  // 插入新的数据
        print(set2)
        print(set2.remove("Tom")!)   // 移除数据，如果set包含该元素，则返回该元素，不存在则返回nil
        print(set2.contains("Jack"))    // 判断是否包含某元素
        
        /** 遍历 */
        for value in set2 {
            print(value)
        }
        
        /** 虽然set是无须的，但也可以对set调用排序方法返回一个有序数组，排序条件为用<比较各个元素 */
        for value in set2.sorted() {
            print(value)
        }
        
        /** 集合的操作 */
        let aSet: Set = [1, 2, 3, 4, 5]
        let bSet: Set = [3, 4, 5, 6, 7]
        // 取交集
        print(aSet.intersection(bSet))
        // 取不同的部分
        print(aSet.symmetricDifference(bSet))
        // 取并集
        print(aSet.union(bSet))
        // 取aSet不同于bSet的部分
        print(aSet.subtracting(bSet))
        
        // 其他运算查看 http://www.swift51.com/swift4.0/chapter2/04_Collection_Types.html
        
        
        
        
        /************************************* 字典 *************************************/
        // 创建一个空字典
        var dict1 = [Int: String]()
        // 添加元素
        dict1[1] = "100"
        print(dict1[1]!)
        // 置空
        dict1 = [:]
        // 支持update、remove、isEmpty、count
        
        // 遍历
        dict1[2] = "赵赫"
        for (key, value) in dict1 {
            print(key, value)
        }
        
        // 打印不存在的value
        print(dict1[3])
    }

    
    
    
    
    
    
    
}
