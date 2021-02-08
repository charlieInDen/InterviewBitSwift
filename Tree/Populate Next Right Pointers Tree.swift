//
//  Populate Next Right Pointers Tree.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation

public class TreeNodeNext {
    public var val: Int
    public var left: TreeNodeNext?
    public var right: TreeNodeNext?
    public var next: TreeNodeNext?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNodeNext?, _ right: TreeNodeNext?) {
        self.val = val
        self.left = left
        self.right = right
    }
}



class PopulateNextRightPointers {
    
    static let shared: PopulateNextRightPointers = PopulateNextRightPointers()
 
    private init () {
        let root: TreeNodeNext = TreeNodeNext(1)
        root.left = TreeNodeNext(2)
        root.right = TreeNodeNext(3)
        root.left?.left = TreeNodeNext(4)
        root.left?.right = TreeNodeNext(5)
        
        root.right?.left = TreeNodeNext(6)
        root.right?.right = TreeNodeNext(7)
         self.populateNextRightPointers(root)
      }
}

extension PopulateNextRightPointers {
    func populateNextRightPointers(_ root: TreeNodeNext?)  {
        if root == nil {return}
        var queue: Queue<TreeNodeNext> = Queue()
        queue.enqueue(root!)
         while !queue.isEmpty {
            var stepQueue = Queue<TreeNodeNext>()
            var nextNode: TreeNodeNext?
            while !queue.isEmpty {
                let deque = queue.dequeue()
                if nextNode == nil { nextNode = deque
                } else {  nextNode?.next = deque }
                if let left = deque?.left { stepQueue.enqueue(left)}
                if let right = deque?.right { stepQueue.enqueue(right) }
            }
            queue = stepQueue
         }
     }
 }
