//
//  Max Depth of Binary Tree.swift
//  Vision
//
//  Created by "" on 08/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation



class MaxDepthOfBinaryTree {
    
    var output: [[Int]] = []

    static let shared: MaxDepthOfBinaryTree = MaxDepthOfBinaryTree()

    private init () {
        let root = TreeNode(10)
        root.left = TreeNode(5)
        root.right = TreeNode(7)
        
        root.left?.left = TreeNode(2)
        root.left?.right = TreeNode(7)
        
        root.right?.left = TreeNode(0)
        root.right?.right = TreeNode(20)
       }
}
 
extension RootToLeafPathsWithSum {
    
    
    func maxDepthOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        let left = 1 + self.maxDepthOfBinaryTree(root?.left)
        let right = 1 + self.maxDepthOfBinaryTree(root?.right)
        return max(left, right)
    }
}
