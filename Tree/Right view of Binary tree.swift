//
//  Right view of Binary tree.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation




class RightViewOfBinaryTree {
    
    static let shared: RightViewOfBinaryTree = RightViewOfBinaryTree()
    
    var maximumRightPostion: Int = -1
 
    private init () {
        let root: TreeNode = TreeNode(7)
        root.left = TreeNode(1)
        root.right = TreeNode(15)
        root.left?.left = TreeNode(2)
        let output = self.rightView(root)
        print(output)
     }
}

extension RightViewOfBinaryTree {
    
    func rightView(_ root: TreeNode?) -> [Int] {
        var rightView: [Int] = []
        self.rightViewOfBinaryTree(root, 0, &rightView)
        return rightView
    }
    
    func rightViewOfBinaryTree(_ root: TreeNode?, _ postion: Int,_ answer: inout [Int]) {
        if root == nil {return }
        if self.maximumRightPostion < postion {
            answer.append(root!.val)
            self.maximumRightPostion  = postion
        }
        self.rightViewOfBinaryTree(root?.right,postion+1,&answer)
        self.rightViewOfBinaryTree(root?.left,postion+1,&answer)
    }
 }
