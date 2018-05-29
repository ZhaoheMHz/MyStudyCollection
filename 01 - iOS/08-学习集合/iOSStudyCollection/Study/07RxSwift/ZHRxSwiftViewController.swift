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
        
//        ObservableDemo()
        
//        CreatDemo()
        
        subjectDemo()
    }
    
    
    func ObservableDemo() {
        /******************** Observable ********************/
        // 定义一个Observable，包含了一些值，也可以用Observable.from创建，效果是一样的
        let numObserverble = Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
            .map {Int($0)}.filter {
                // 当是2的倍数的时候，打印返回true
                if let item = $0, item%2 == 0 {
                    print("num: \(item)")
                    return true
                }
                return false
        }
        
        // 只有订阅了，各种事件才会执行
        _ = numObserverble.subscribe { (event) in
            print("event:\(event)")
            
            // 最后会打印event:completed，表示事件完成了
        }
        
        // 也有类似skip的东西
        _ = numObserverble.skip(2).subscribe { event in
            print("2event:\(event)")
        }
        
        // 也可以监听next、complete
        _ = numObserverble.subscribe(
            onNext: { event in
                print(event ?? "")
        },
            onError: { print("\($0)")},
            onCompleted: {
                print("complete")
        },
            onDisposed: {}
        )
        
        
        
        
        /******************** Dispose ********************/
        /** Dispose */
        let disposable = Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(
            onNext: { print("\($0)")},
            onDisposed: { print("Disposed")}
        )
        // 4s后取消
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4) {
            disposable.dispose()
        }
        
        
        /** DisposeBag，管理Dispose */
        var disposeBag = DisposeBag()
        Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(
            onNext: { print("\($0)")},
            onDisposed: { print("Disposed2")}
        ).disposed(by: disposeBag)
        // 4s后取消
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4) {
            // 直接
            disposeBag = DisposeBag()
        }
    }
    
    
    
    
    func CreatDemo() {
        /******************** create ********************/
        enum CustomError: Error {
            case somethingError
        }
        
        // 创建一个Observable，一个局部的观察者，用以发送Next、Error等
        let customOb = Observable<Int>.create { observer -> Disposable in
            // next
            observer.onNext(10)
            observer.onNext(11)
            
            // error，当error发生的时候，onCompleted不会被调用
            observer.onError(CustomError.somethingError)
            
            observer.onCompleted()

            // 返回一个Dispose
            return Disposables.create()
        }
        
        let disposeBag = DisposeBag()
//        customOb.subscribe(
//            onNext: { print("\($0)")},
//            onError: { print("\($0)")},
//            onCompleted: { print("completed")},
//            onDisposed: { print("disposed")}
//        ).disposed(by: disposeBag)
        
        
        
        /******************** Do ********************/
//        customOb.do(
//            onNext: { print("do:\($0)")},
//            onError: { print("do:\($0)")},
//            onCompleted: { print("do:completed")},
//            onDispose: { print("do:dispose")}
//            )
//            .subscribe(
//            onNext: { print("\($0)")},
//            onError: { print("\($0)")},
//            onCompleted: { print("completed")},
//            onDisposed: { print("disposed")}
//            ).disposed(by: disposeBag)
        
        
        
        /******************** Debug ********************/
        customOb.debug().subscribe(
                onNext: { print("\($0)")},
                onError: { print("\($0)")},
                onCompleted: { print("completed")},
                onDisposed: { print("disposed")}
            ).disposed(by: disposeBag)
    }
    
    
    
    func subjectDemo() {
        /******************** PublishSubject ********************/
//        let subj1 = PublishSubject<String>()
//
//        var disposeBag = DisposeBag()
//        // 需要先订阅
//        subj1.subscribe(
//            onNext: {print($0)}
//        ).disposed(by: disposeBag)
//        // 发布next
//        subj1.onNext("发布1")
        
        
        
        /******************** BehaviorSubject ********************/
//        let subj2 = BehaviorSubject<String>(value: "最近一次的next")
//
//        // 会收到BehaviorSubject设置的value默认值
//        subj2.subscribe(
//            onNext: { print($0)}
//        )
//        subj2.onNext("最近一次历史消息")
//
//        // 再次订阅，就会收到上一条历史消息，也就是上面的一个onNext发送的消息
//        subj2.subscribe(
//            onNext: { print($0)}
//        )
//        subj2.onNext("最新的消息")
        
        
        
        
        
        /******************** ReplaySubject ********************/
//        // bufferSize决定了产生新的订阅的时候可以获取的历史消息数量
//        let subj3 = ReplaySubject<String>.create(bufferSize: 1)
//        subj3.subscribe(
//            onNext: { print("订阅1：\($0)")}
//        )
//        subj3.onNext("1")
//        subj3.onNext("2")
//        subj3.onNext("3")
//
//        // 这次订阅，只能收到1条历史消息，也就是上面的3，和下面最新发送的4
//        subj3.subscribe(
//            onNext: { print("订阅2：\($0)")}
//        )
//        subj3.onNext("4")
        
        
        
        
        
        /******************** VariableSubject（官方已经遗弃，建议使用BehaviorRelay） ********************/
        let stringVariable = Variable("name")       // 声明一个可观察的字符串
        let subj4 = stringVariable.asObservable().subscribe(onNext: {print($0)})        // 监听string的值
        // 也可直接获取值
        print(stringVariable.value)
        // 重新赋值，则相当于发送一个新的onNext事件，上面的订阅代码的onNext就会执行，然后会立刻发送onCompleted
        stringVariable.value = "赵赫"
    }
}
