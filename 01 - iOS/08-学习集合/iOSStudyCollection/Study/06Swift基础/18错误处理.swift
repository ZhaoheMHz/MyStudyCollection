//
//  18错误处理.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/7.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal18: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try someFunc(inPara: 9)
        }
        // 当前方法处理了三个枚举中存在的错误
        catch VendingMachineError.insufficientFunds(let coinsNeeded) {
            print("金额不足，需要：\(coinsNeeded)")
        } catch VendingMachineError.invalidSelection {
            print("选择无效")
        } catch VendingMachineError.outOfStock {
            print("缺货")
        }
        // 因为不排除还有其他错误抛出，所以在以上三种情况之外，还要做好其他任何错误的catch
        catch {
            print("其他错误")
        }
        
        
        
        /** 将错误转换为可选值，如果有错误抛出，返回nil */
        let error = try? someFunc(inPara: 7)
        print(error)
        
        
        
        /** 禁用错误传递，当错误一定不会抛出的时候用try! */
        print(try! someFunc(inPara: 11))
        
        
        
        
        
        // defer语句，允许在当前作用于return之后执行一些代码，不管是break，return、throw
        defer {
            print("defer1")
        }
        defer {
            print("defer2")
        }
        print("函数执行完了")
        // 这里打印顺序为：函数执行完了、defer2、defer1，最上面的defer语句，会在最后执行
    }
    
    // throwing函数，在返回值前面加上throws，标识当前函数可以抛出错误
    func someFunc(inPara: Int) throws -> Int {
        if inPara < 10 {
            // throw会直接退出方法
            throw VendingMachineError.insufficientFunds(coinsNeeded: 10)
        } else {
            return inPara
        }
    }

}


enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}
