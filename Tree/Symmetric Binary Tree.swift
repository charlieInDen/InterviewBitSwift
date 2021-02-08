//
//  Symmetric Binary Tree.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class SymmetricBinaryTree {
    
    static let shared: SymmetricBinaryTree = SymmetricBinaryTree()
    
    var isBalenced: Bool = true
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        root.left?.left?.left = TreeNode(2)
    }
}


extension SymmetricBinaryTree {
    private func identicalBinaryTree(_ first: TreeNode?, _ second: TreeNode?) -> Bool {
        if first == nil && second == nil {return true}
        if first == nil && second != nil || first != nil && second == nil  {return false}
        return first!.val == second!.val && self.identicalBinaryTree(first?.left, second?.right) && self.identicalBinaryTree(first?.right, second?.left)
    }
}
