//
//  12下标.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/3.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal12: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 结构体可以通过下标调用一些东西了
        let a = Struct121()
        print(a[10])
        print(a[2, "00"])
    }

}



struct Struct121 {
    // 下标
    subscript(index: Int) -> Int {
        get {
            return index * 10
        }
        
        set {
            
        }
    }
    
    // 下标也可以多个参数
    subscript(index: Int, index2: String) -> String {
        return "\(index)\(index2)"
    }
}
