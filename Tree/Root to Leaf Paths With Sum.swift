//
//  Root to Leaf Paths With Sum.swift
//  Vision
//
//  Created by "" on 08/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class RootToLeafPathsWithSum {
    
    var output: [[Int]] = []

    static let shared: RootToLeafPathsWithSum = RootToLeafPathsWithSum()

    private init () {
        let root = TreeNode(10)
        root.left = TreeNode(5)
        root.right = TreeNode(7)
        
        root.left?.left = TreeNode(2)
        root.left?.right = TreeNode(7)
        
        root.right?.left = TreeNode(0)
        root.right?.right = TreeNode(20)
        
        self.rootToLeafPathsWithSum(root, 17, [], 0)
        print(output)
      }
}
 
extension RootToLeafPathsWithSum {
    
    
    func rootToLeafPathsWithSum(_ root: TreeNode?, _ sum: Int, _ pathSum: [Int], _ totalSum: Int) {
        
        if root == nil {return}
        
        if root?.left == nil &&  root?.right == nil && totalSum+root!.val == sum {
            var path = pathSum
            path.append(root!.val)
            output.append(path)
            return
        }
       
        var path = pathSum
        path.append(root!.val)
        self.rootToLeafPathsWithSum(root?.left, sum,path, totalSum+root!.val)
        self.rootToLeafPathsWithSum(root?.right, sum,path ,totalSum+root!.val)
    }
}
