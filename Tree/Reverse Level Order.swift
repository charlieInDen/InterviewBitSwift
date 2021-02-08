//
//  Reverse Level Order.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation



class ReverseLevelOrder {
    
    static let shared: ReverseLevelOrder = ReverseLevelOrder()
 
    private init () {
        let root: TreeNode = TreeNode(1)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left?.left = TreeNode(4)
        root.left?.right = TreeNode(5)
        
        root.right?.left = TreeNode(6)
        root.right?.right = TreeNode(7)
        let output = self.reverseLevelOrder(root)
        print(output)
     }
}

extension ReverseLevelOrder {
    func reverseLevelOrder(_ root: TreeNode?)  -> [Int] {
        if root == nil {return []}
        var queue: Queue<TreeNode> = Queue()
        var outputQueue: Queue<Int> = Queue()
        queue.enqueue(root!)
        outputQueue.enqueue(root!.val)
        while !queue.isEmpty {
            var stepQueue = Queue<TreeNode>()
            while !queue.isEmpty {
                let deque = queue.dequeue()
                if let left = deque?.left { stepQueue.enqueue(left)}
                if let right = deque?.right { stepQueue.enqueue(right) }
            }
            queue = stepQueue
            stepQueue.array.reverse()
            for index in stepQueue.array {outputQueue.enqueue(index.val)}
            
        }
        outputQueue.array.reverse()
        return outputQueue.array
    }
 }
