//
//  Path Sum.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation

//
class PathSum {

    static let shared: PathSum = PathSum()

    private init () {
        let root = TreeNode(5)
        root.left = TreeNode(1000)
        root.right = TreeNode(200)
        let hasPathSum = self.pathSum(root, 1000, 0)
        print(hasPathSum)
      }
}
 
extension PathSum {
    func pathSum(_ root: TreeNode?, _ sum: Int, _ pathSum: Int) -> Bool  {
        if root == nil && pathSum == sum { return true}
        if root == nil {return false}
        return self.pathSum(root?.left, sum, pathSum+root!.val) || self.pathSum(root?.right, sum, pathSum+root!.val)
    }
}


