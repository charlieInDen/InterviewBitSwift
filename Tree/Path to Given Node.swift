//
//  Path to Given Node.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class PathtoGivenNode {
    
    static let shared: PathtoGivenNode = PathtoGivenNode()
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.pathtoGivenNode(root, 2, path: [])
        print(output)
    }
}


extension PathtoGivenNode {
    private func pathtoGivenNode(_ root: TreeNode?, _ target: Int, path: [Int]) -> [Int] {
        if root == nil {return []}
        var currentpath = path
        currentpath.append(root!.val)
        if root!.val == target {return currentpath}
        let left = self.pathtoGivenNode(root?.left, target, path: currentpath)
        let right = self.pathtoGivenNode(root?.right, target, path: currentpath)
        return left.count > 0 ? left : right
    }
}
