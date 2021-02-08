//
//  Preorder Traversal.swift
//  Vision
//
//  Created by "" on 05/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class PreorderTraversal {
    
    static let shared: PreorderTraversal = PreorderTraversal()
 
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.preorderTraversal(root)
        print(output)
     }
}

extension PreorderTraversal {
     func preorderTraversal(_ root: TreeNode?)  -> [Int] {
        if root == nil {return []}
        var output: [Int] = []
        var current: TreeNode? = root
        var stack: Stack<TreeNode> = Stack()
 
        while !stack.isEmpty || current != nil {
            while current != nil {
                output.append(current!.val)
                stack.push(current!)
                current = current?.left
            }
            let pop = stack.pop()
            current = pop?.right
        }
 
        return output
    }
 }
