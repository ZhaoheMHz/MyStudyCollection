//
//  19类型转换.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/7.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class Normal19: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        // 数组被类型推断为[MediaItem]
        
        
        
        // 获取每个子类的数量
        var movieCount = 0
        var songCount = 0
        var mediaCount = 0
        for item in library {
            // 通过is判断类型
            if item is Movie {
                movieCount += 1
            }
            if item is Song {
                songCount += 1
            }
            if item is MediaItem {
                mediaCount += 1
            }
        }
        print("movie：\(movieCount) song：\(songCount) media：\(mediaCount)")
        
        
        
        
        /** 向下转型 */
        let media1 = MediaItem(name: "")
        // 转换失败将会变成nil
        if media1 as? Movie == nil {
            print("不是子类")
        } else {
            print("是子类")
        }
        // as! 强转
        
        
        
        /** Any 可以表示任何类型，包括函数类型。
         AnyObject 可以表示任何类类型的实例。 */
        var arr = [Any]()
        arr.append(1)
        arr.append(11.1)
        arr.append("ni")
    }
}



class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
