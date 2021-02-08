//
//  Burn a Tree.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class BurnATree {
    
    static let shared: BurnATree = BurnATree()
    
    private init () {
        var root: TreeNode = TreeNode(1)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left?.left = TreeNode(4)
        root.right?.left = TreeNode(5)
        root.right?.right = TreeNode(6)
       let output = self.burnATree(root, 4)
        print(output)
      }
}


extension BurnATree {
    func burnATree(_ root: TreeNode?, _ start: Int) -> Int  {
        if root == nil {return 0}
        var parentChildMap: [Int: TreeNode] = [:]
        self.storeParent(root, nil, hashMap: &parentChildMap)
        let node = self.moveToNode(root, start)
        var visited: Set<Int> = Set()
        return self.applyBFS(node, visited: &visited, hashMap: parentChildMap)
    }
    
    
    func applyBFS(_ root: TreeNode?, visited: inout Set<Int>, hashMap: [Int: TreeNode]) -> Int {
        if root == nil {return 0}
        let parent = hashMap[root!.val]
        var leftTime: Int = 0
        var rightTime: Int = 0
        var parentTime: Int = 0
        if let left = root?.left, !visited.contains(left.val) {
            visited.insert(left.val)
            leftTime = 1 + self.applyBFS(root?.left, visited: &visited, hashMap: hashMap)
        }
         
        if let right = root?.right, !visited.contains(right.val) {
            visited.insert(right.val)
            rightTime = 1 + self.applyBFS(right, visited: &visited, hashMap: hashMap)
        }
        
        if parent != nil, !visited.contains(parent!.val) {
            visited.insert(parent!.val)
            parentTime = 1 + self.applyBFS(parent, visited: &visited, hashMap: hashMap)
        }
        return max(leftTime, rightTime,parentTime)
     }
    
    func storeParent(_ node: TreeNode?, _ parent: TreeNode?, hashMap: inout [Int: TreeNode]) {
        if node == nil {return}
        if let parentVal = parent { hashMap[node!.val] =  parentVal}
        self.storeParent(node?.left, node, hashMap: &hashMap)
        self.storeParent(node?.right, node, hashMap: &hashMap)
    }
    
    func moveToNode(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {return nil}
        if root!.val == val {return root}
        let left = self.moveToNode(root?.left, val)
        let right = self.moveToNode(root?.right, val)
        return left != nil ? left : right
    }
}
