//
//  Sorted Array To Balanced BST.swift
//  Vision
//
//  Created by "" on 07/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class SortedArrayToBalancedBST {
    
    static let shared: SortedArrayToBalancedBST = SortedArrayToBalancedBST()
    
    private init () {
      }
}


extension SortedArrayToBalancedBST {
    func sortedArrayToBalancedBST(_ root: [Int], _ start: Int, _ end: Int) -> TreeNode?  {
        if start > end {return nil}
        if start == end {return TreeNode(root[start])}
        let mid = start + (end-start)/2
        let tree = TreeNode(root[mid])
        tree.left = self.sortedArrayToBalancedBST(root, start, mid-1)
        tree.right = self.sortedArrayToBalancedBST(root, mid+1, end)
        return tree
    }
}
