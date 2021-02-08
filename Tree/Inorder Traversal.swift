//
//  Inorder Traversal.swift
//  Vision
//
//  Created by "" on 05/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class InorderTraversal {
    
    static let shared: InorderTraversal = InorderTraversal()
 
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.inorderTraversal(root)
        print(output)
     }
}

extension InorderTraversal {
     func inorderTraversal(_ root: TreeNode?)  -> [Int] {
        if root == nil {return []}
        var output: [Int] = []
        var current: TreeNode? = root
        var stack: Stack<TreeNode> = Stack()
 
        while !stack.isEmpty || current != nil {
            
            while current != nil {
                stack.push(current!)
                current = current?.left
            }
            let pop = stack.pop()
            output.append(pop!.val)
            current = pop?.right
        }
 
        return output
    }
 }
