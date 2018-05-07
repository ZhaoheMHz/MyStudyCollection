//
//  05控制流.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/25.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal05: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        /** for-in */
        for index in 1...5 {
            print(index)
        }
        // 不需要取值则可以用_代替
        for _ in 1...5 {
            print("打印啊")
        }
        
        for index in stride(from: 0, to: 10, by: 3) {
            print(index)    // 结果0，3，6，9    按3取间隔
        }
        
        // while和repeat-while
        
        // if
        
        /** Switch */
        // swift中不存在break
        let a = 1
        switch a {
        case 1:
            print("switch 1")   // 这里只会打印"switch 1"，不会存在直接把下面的分支执行了的情况
        case 2:
            print("switch 2")
        default:
            print("default")
        }
        
        // 如果想匹配多个条件，可以按下面的方式写
        switch a {
        case 1, 2:
            print("switch 1")
        default:
            print("default")
        }
        
        // 值绑定
//        更多用法见 http://www.swift51.com/swift4.0/chapter2/05_Control_Flow.html
        // 另外还有continue和break的用法
        
        /** 贯穿，fallthrough */
        // 因为swift的switch取消的对break的支持，所以如果想让case语句向下贯穿，需要在case语句结束后加上fallthrough
        switch a {
        case 1:
            print("fallthrough switch 1")
            fallthrough
        default:
            print("fallthrough default")
        }
        
        
        // 带标签的语句
//        见 http://www.swift51.com/swift4.0/chapter2/05_Control_Flow.html
        
        
        /** guard */
//        var str: String?
//        guard let str2 = str else {
//            // guard主要用于确保guard的条件一定正确，如果条件不满足，则应该让当前方法提前退出
//            print("提前退出了")
//            return;
//        }
        
        // #available可用在if或者guard中，确保代码块中的方法在当前系统下可用
        if #available(iOS 11.0, *) {
            print("api可用")
        } else {
            print("api不可用")
        }
    }
    
    
    
    
    
    
    
    
    
    
}
