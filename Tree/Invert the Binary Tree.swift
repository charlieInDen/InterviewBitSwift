//
//  Invert the Binary Tree.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class InvertTheBinaryTree {
    
    static let shared: InvertTheBinaryTree = InvertTheBinaryTree()
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.invertTheBinaryTree(root)
        print(output)
    }
}


extension InvertTheBinaryTree {
    func invertTheBinaryTree(_ root: TreeNode?) -> TreeNode?  {
        if root == nil {return nil}
        let new = TreeNode(root!.val)
        new.left = self.invertTheBinaryTree(root?.right)
        new.right = self.invertTheBinaryTree(root?.left)
        return new
    }
}
