//
//  Merge two Binary Tree.swift
//  Vision
//
//  Created by "" on 02/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class MergetwoBinaryTree {
    
    static let shared: MergetwoBinaryTree = MergetwoBinaryTree()
    
    private init () {
        
     }
}


extension MergetwoBinaryTree {
    
    
    private func merge(_ first: TreeNode?, _ second: TreeNode?) -> TreeNode? {
        if first == nil && second == nil {return nil}
        
        var sum: Int = 0
        if let firstVal = first?.val {
           sum += firstVal
        }
        
        if let secondVal = second?.val {
             sum += secondVal
        }
        
        let node = TreeNode(sum)
        node.left = self.merge(first?.left, second?.left)
        node.right = self.merge(first?.right, second?.right)
        return node
     }
}

