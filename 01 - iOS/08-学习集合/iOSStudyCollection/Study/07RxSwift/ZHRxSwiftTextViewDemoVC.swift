//
//  ZHRxSwiftTextViewDemoVC.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2019/5/31.
//  Copyright © 2019 赵赫. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct ViewModel {
    // 可观察序列对象
    let data = Observable.just([
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
        ])
}

struct Music {
    let name: String
    let singer: String
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension Music: CustomDebugStringConvertible {
    var debugDescription: String {
        return "name：\(name) singer：\(singer)"
    }
}

class ZHRxSwiftTextViewDemoVC: UIViewController {

    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        // 绑定数据源
        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "Cell")) { (_, music, cell) in
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.singer
            }.disposed(by: disposeBag)
        
        // cell点击事件
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { (music) in
            print("你选中的歌曲信息【\(music)】")
        }).disposed(by: disposeBag)
    }
}
