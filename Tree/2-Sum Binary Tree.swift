//
//  2-Sum Binary Tree.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class TwoSumTree {
    
    static let shared: TwoSumTree = TwoSumTree()
    
    var output:Int = 0
    
 
    private init () {
        var hashMap: Set<Int> =  Set<Int>()
        let root: TreeNode = TreeNode(7)
        root.right = TreeNode(10)
        root.right?.left = TreeNode(9)
        root.right?.right = TreeNode(20)
        let output = self.twoSumTree(root,19,&hashMap)
        print(output)
    }
}


extension TwoSumTree {
    
    private func twoSumTree(_ root: TreeNode?, _ target: Int, _ hashMap: inout Set<Int>) -> Bool {
        if root == nil {return false}
        let remain = target - root!.val
        if hashMap.contains(remain) {
            return true
        } else {
            hashMap.insert(root!.val)
        }
        return self.twoSumTree(root?.right, target, &hashMap) || self.twoSumTree(root?.left, target, &hashMap)
    }
}
