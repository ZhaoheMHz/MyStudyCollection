//
//  链表.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/8/14.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit


// 链表节点
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil;
    }
}

// 链表
class List {
    var head: ListNode?
    var tail: ListNode?
    
    // 尾插
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    
    // 头插
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head;
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    
    // 获取所有节点的值
    func getAllNodeVal() -> [Int]? {
        if head == nil {
            return nil
        }
        
        var arr: [Int] = []
        var tempNode = head
        while tempNode?.next != nil {
            arr.append(tempNode!.val)
            tempNode = tempNode?.next
        }
        arr.append(tail!.val)
        return arr
    }
    
    // 通过x分割链表，让小于x的节点放在链表左侧，大于x的节点放在链表右侧
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        // 创建Dummy节点
        let prevDummy = ListNode(0)
        var prev = prevDummy
        let postDummy = ListNode(0)
        var post = postDummy
        
        // 指定第一个节点为头结点
        var node = head
        while node != nil {
            if node!.val < x {
                prev.next = node
                prev = node!
            } else {
                post.next = node
                post = node!
            }
            node = node!.next
        }
        
        // 左右拼接
        post.next = nil
        prev.next = postDummy.next
        
        // 返回Dummy节点的下一个节点就是head节点
        return prevDummy.next
    }
}
