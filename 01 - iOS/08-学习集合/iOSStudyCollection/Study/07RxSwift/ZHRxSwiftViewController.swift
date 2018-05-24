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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /** Observable */
        exmaple(of: "just, of, from") {
            let one = 1
            let two = 2
            let three = 3
            
//            let observable: Observable<Int> = Observable<Int>.just(one)
//            observable.subscribe({ (event) in
//                print(event)
//            })
            
            let tf = UILabel()
        }
    }
    
    
    
    public func exmaple(of description: String, action: () -> Void) {
        print("\n--- Example of:", description, "---")
        action()
    }
}
