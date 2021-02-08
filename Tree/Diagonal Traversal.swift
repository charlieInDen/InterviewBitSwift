//
//  Diagonal Traversal.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class  DiagonalTraversal {
    
    static let shared: DiagonalTraversal = DiagonalTraversal()
 
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.diagonalTraversal(root)
        print(output)
     }
}

extension DiagonalTraversal {
     func diagonalTraversal(_ root: TreeNode?) -> [Int] {
        var output: [[Int]] = []
        self.diagonalTraversal(root, 0, output: &output)
        var result:[Int] = []
        for i in output {  result.append(contentsOf: i)  }
        return result
    }
    
    private func diagonalTraversal(_ root: TreeNode?, _ side: Int, output: inout [[Int]]) {
        if root == nil {return}
        if output.count > side {
            var newVal = output[side]
            newVal.append(root!.val)
            output[side] = newVal
        } else {
            output.append([root!.val])
        }
        self.diagonalTraversal(root?.left, side+1, output: &output)
        self.diagonalTraversal(root?.right, side, output: &output)
    }
}
