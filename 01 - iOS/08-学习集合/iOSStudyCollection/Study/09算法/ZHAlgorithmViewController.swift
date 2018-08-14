//
//  ZHAlgorithmViewController.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/8/14.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

class ZHAlgorithmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///******************************** 链表 ********************************/
        // 创建链表
        let list = List()
        // 向链表中追加节点
        list.appendToHead(1)
        list.appendToTail(5)
        list.appendToTail(3)
        list.appendToTail(2)
        list.appendToTail(4)
        list.appendToTail(2)
        // 按3分割链表，小于3的在左，大于等于3的在右
        print(list.partition(nil, 3)?.val)
        
        
        
        
        ///******************************** 二叉树 ********************************/
        /**
         以下面的二叉树为例
         10
         / \
        9   20
            / \
           15  35
        */
        // 创建二叉树的节点
        let rootNode = TreeNode(10)
        let node1 = TreeNode(9)
        let node2 = TreeNode(20)
        let node3 = TreeNode(15)
        let node4 = TreeNode(35)
        
        // 将二叉树连在一起
        rootNode.leftNode = node1
        rootNode.rightNode = node2
        node2.leftNode = node3
        node2.rightNode = node4
        
        // 获取最大深度
        print(getMaxDepth(rootNode))
        // 获取最小深度
        print(getMinDepth(rootNode))
        
        // 前序遍历
        print("前序")
        getPreTraverseTree(rootNode)
        
        // 中序遍历
        print("中序")
        getInTraverseTree(rootNode)
        
        // 后序遍历
        print("后序")
        getPostTraverseTree(rootNode)
    }
}
