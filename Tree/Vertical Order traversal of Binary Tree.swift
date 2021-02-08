//
//  Vertical Order traversal of Binary Tree.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class VerticalOrdertraversalofBinaryTree {
    
    static let shared: VerticalOrdertraversalofBinaryTree = VerticalOrdertraversalofBinaryTree()
    
    var isBalenced: Bool = true
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        root.left?.left?.left = TreeNode(2)
        
    }
}


extension VerticalOrdertraversalofBinaryTree {
    
    func findVerticalOrderTrivarsel(_ root: TreeNode?) {
        var hash: [Int: [Int]] = [:]
        self.verticalOrdertraversalofBinaryTree(root, 0, hash: &hash)
    }
    
    private func verticalOrdertraversalofBinaryTree(_ root: TreeNode?, _ side: Int, hash: inout [Int: [Int]]) {
        if root == nil {return}
        if var indexArray = hash[side] {
            indexArray.append(root!.val)
            hash[side] = indexArray
        } else {hash[side] = [root!.val] }
        self.verticalOrdertraversalofBinaryTree(root?.left, side-1, hash: &hash)
        self.verticalOrdertraversalofBinaryTree(root?.right, side+1, hash: &hash)
    }
}
