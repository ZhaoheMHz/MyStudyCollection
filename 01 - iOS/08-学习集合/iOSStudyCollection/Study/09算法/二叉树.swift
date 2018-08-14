//
//  二叉树.swift
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/8/14.
//  Copyright © 2018年 赵赫. All rights reserved.
//

import UIKit

// 树节点
class TreeNode {
    // 左右节点
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    // 值
    var value: Int
    
    // 初始化
    init(_ val: Int) {
        value = val
    }
}

/**
 获取二叉树的最大深度
 */
func getMaxDepth(_ rootNode: TreeNode?) -> Int {
    guard let _ = rootNode else {
        return 0
    }
    
    return max(getMaxDepth(rootNode!.leftNode), getMaxDepth(rootNode!.rightNode))+1
}

/**
 获取二叉树的最小深度
 */
func getMinDepth(_ rootNode: TreeNode?) -> Int {
    guard let _ = rootNode else {
        return 0
    }
    
    return min(getMinDepth(rootNode!.leftNode), getMinDepth(rootNode!.rightNode))+1
}


///******************************** 遍历 ********************************/
/**
 前序
 */
func getPreTraverseTree(_ rootNode: TreeNode?) {
    guard let _ = rootNode else {
        return
    }
    
    print(rootNode!.value)
    getPreTraverseTree(rootNode!.leftNode)
    getPreTraverseTree(rootNode!.rightNode)
}

/**
 中序
 */
func getInTraverseTree(_ rootNode: TreeNode?) {
    guard let _ = rootNode else {
        return
    }
    
    getInTraverseTree(rootNode!.leftNode)
    print(rootNode!.value)
    getInTraverseTree(rootNode!.rightNode)
}

/**
 后序
 */
func getPostTraverseTree(_ rootNode: TreeNode?) {
    guard let _ = rootNode else {
        return
    }
    
    getPostTraverseTree(rootNode!.leftNode)
    getPostTraverseTree(rootNode!.rightNode)
    print(rootNode!.value)
}
