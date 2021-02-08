//
//  Cousins in Binary Tree.swift
//  Vision
//
//  Created by "" on 05/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation



class CousinsInBinaryTree {
    
    static let shared: CousinsInBinaryTree = CousinsInBinaryTree()
 
    private init () {
        let root: TreeNode = TreeNode(2)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left?.left = TreeNode(4)
        root.left?.right = TreeNode(5)
        
        root.right?.left = TreeNode(6)
        root.right?.right = TreeNode(7)
        let output = self.cousinsInBinaryTree(root, 5)
        print(output)
     }
}

extension CousinsInBinaryTree {
    func cousinsInBinaryTree(_ root: TreeNode?, _ child: Int)  -> [Int] {
        if root == nil {return []}
        var output: [Int] = []
        var queue: Queue<(TreeNode,TreeNode?)> = Queue()
        queue.enqueue((root!,nil))
        
        
        var isParent: TreeNode?
        var isFind: Bool = false
        
        while !queue.isEmpty {
            var stepQueue = Queue<(TreeNode,TreeNode?)>()
            
            while !queue.isEmpty {
                let deque = queue.dequeue()
                
                if let left = deque?.0.left {
                    if left.val == child {
                        isFind = true
                        isParent = deque?.0
                    }
                    stepQueue.enqueue((left,deque?.0))
                }
                
                if let right = deque?.0.right {
                    if right.val == child {
                        isFind = true
                        isParent = deque?.0
                    }
                    stepQueue.enqueue((right,deque?.0))
                }
            }
            
            queue = stepQueue
            if isFind == true { break }
        }
        
        if isFind {
            for item in queue.array {
                if item.1!.val == isParent!.val {continue}
                output.append(item.0.val)
            }
        }
        return output
    }
 }
