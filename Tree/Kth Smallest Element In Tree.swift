//
//  Kth Smallest Element In Tree.swift
//  Vision
//
//  Created by "" on 04/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class KthSmallestElementInTree {
    
    var kthSmallest: Int?
    
    static let shared: KthSmallestElementInTree = KthSmallestElementInTree()
    
    private init () {
        var index: Int = 2
        let root: TreeNode = TreeNode(2)
        root.left = TreeNode(1)
        root.right = TreeNode(3)
        self.kthSmallestElementInTree(root, &index)
        print(kthSmallest)
     }
}


extension KthSmallestElementInTree {
    
    
    private func kthSmallestElementInTree(_ root: TreeNode?, _ element: inout Int) {
        if root == nil {return }
        self.kthSmallestElementInTree(root?.left, &element)
        element = element-1
        if element == 0 {  kthSmallest = root!.val
            return
        }
        self.kthSmallestElementInTree(root?.right, &element)
    }
}
