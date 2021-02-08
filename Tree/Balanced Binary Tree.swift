//
//  Balanced Binary Tree.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class BalancedBinaryTree {
    
    static let shared: BalancedBinaryTree = BalancedBinaryTree()
    
    var isBalenced: Bool = true
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        root.left?.left?.left = TreeNode(2)
        let _ = self.balancedBinaryTree(root)
        print(isBalenced)
    }
}


extension BalancedBinaryTree {
    private func balancedBinaryTree(_ root: TreeNode?) -> Int {
         if root == nil {return 0}
        let left = 1 + self.balancedBinaryTree(root?.left)
        let right = 1 + self.balancedBinaryTree(root?.right)
        isBalenced = isBalenced && abs(left-right) <= 1
        return max(left, right)
    }
}
