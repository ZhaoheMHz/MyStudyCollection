//
//  ZHRxSwiftViewController.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/4/27.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ZHRxSwiftViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController!.pushViewController(ZHRxSwiftTextViewDemoVC(), animated: true)
    }
}
