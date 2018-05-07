//
//  ZHReactiveSwiftDemoController.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/14.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class ZHReactiveSwiftDemoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK:rac的基本用法
    @IBAction func basicUsage(_ sender: UIButton) {
        /****************************************** 冷信号 ******************************************/
        let producer = SignalProducer<String, NoError>.init { (observer, _) in
            
        }
    }
}
