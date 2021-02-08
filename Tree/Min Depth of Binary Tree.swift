//
//  Min Depth of Binary Tree.swift
//  Vision
//
//  Created by "" on 08/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class MinDepthOfBinaryTree {
 
    static let shared: MinDepthOfBinaryTree = MinDepthOfBinaryTree()

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
 
extension MinDepthOfBinaryTree {
    
    
    func minDepthOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        if root?.left == nil && root?.right == nil {return 1}
        
        if root?.left == nil {
            return 1 + self.minDepthOfBinaryTree(root?.right)
        }
        
        if root?.right == nil {
            return 1 + self.minDepthOfBinaryTree(root?.left)
        }
        
        
       return min(self.minDepthOfBinaryTree(root?.left), self.minDepthOfBinaryTree(root?.right)) + 1
    }
}
