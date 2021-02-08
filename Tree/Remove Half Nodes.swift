//
//  Remove Half Nodes.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class RemoveHalfNodes {
    
    static let shared: RemoveHalfNodes = RemoveHalfNodes()
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.removeHalfNodes(root)
        print(output)
    }
}


extension RemoveHalfNodes {
    private func removeHalfNodes(_ root: TreeNode?) -> TreeNode? {
        if root == nil {return nil}
        if root?.left == nil && root?.right == nil {return root}
        let node = TreeNode(root!.val)
        let left = self.removeHalfNodes(root?.left)
        let right = self.removeHalfNodes(root?.right)
        
        if left != nil && right != nil {
            node.left = left
            node.right = right
            return node
        }
        return left == nil ? right : left
    }
}
