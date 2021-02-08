//
//  Least Common Ancestor.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


 

class LeastCommonAncestor {
    
    static let shared: LeastCommonAncestor = LeastCommonAncestor()
    
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.leastCommonAncestor(root, 15, 2)
        print(output)
    }
}


extension LeastCommonAncestor {
    func leastCommonAncestor(_ root: TreeNode? , _ first: Int, _ second: Int) -> Int  {
           if root == nil {return -1}
           if root!.val == first || root!.val == second { return root!.val}
           let left = self.leastCommonAncestor(root?.left, first, second)
           let right = self.leastCommonAncestor(root?.right, first, second)
           if left != -1 && right != -1 {return root!.val }
           return left != -1 ? left : right
           
       }
}

