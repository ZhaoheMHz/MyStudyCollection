//
//  20嵌套类型.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/7.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal20: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 通过.的方式调用嵌套类型
        Class201.Class2011()
    }
    
}



class Class201 {
    
    class Class2011 {
        
    }
}
