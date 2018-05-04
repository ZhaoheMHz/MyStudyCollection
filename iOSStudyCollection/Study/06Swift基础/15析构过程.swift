//
//  15析构过程.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/4.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal15: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let _ = Class151()
    }
    
    // 只有类才有析构过程
    deinit {
       // 这里会自动调用父类的析构器
    }
}

class Class151 {
    deinit {
        print("deinit了")
    }
}
