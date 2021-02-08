//
//  Recover Binary Search Tree.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class RecoverBinarySearchTree {
    
    static let shared: RecoverBinarySearchTree = RecoverBinarySearchTree()
    
    var firstNode:TreeNode?
    var secondNode:TreeNode?
    var previousNode:TreeNode?
 
    private init () {
        let root: TreeNode = TreeNode(7)
        root.right = TreeNode(10)
        root.right?.left = TreeNode(9)
        root.right?.right = TreeNode(20)
    }
}


extension RecoverBinarySearchTree {
    private func recoverBinarySearchTree(_ root: TreeNode?, _ output: inout [Int])  {
        if root == nil {return}
        if output.count == 2 {return}
        if let previous = self.previousNode, previous.val > root!.val  {
            output.append(root!.val)
        }
        if output.count == 2 {return}
        previousNode = root
        self.recoverBinarySearchTree(root?.left, &output)
        self.recoverBinarySearchTree(root?.right, &output)
    }
}
