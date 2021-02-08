//
//  Valid BST from Preorder.swift
//  Vision
//
//  Created by "" on 01/02/21.
//  Copyright © 2021 "". All rights reserved.
//

import Foundation


class ValidBSTFromPreorder {
    
    static let shared: ValidBSTFromPreorder = ValidBSTFromPreorder()
    
    private init () {
        let input: [Int] = [2, 4, 3]
        let output = self.isValidBST(input)
        print(output)
    }
}


extension ValidBSTFromPreorder {
    
    
    private func isValidBST(_ input: [Int]) -> Bool {
        var stack: Stack<Int> = Stack()
        var root: Int = Int.min
        
        for element in input {
            if element < root { return false }
            while let top = stack.top, top < element {
                root = stack.pop()!
            }
            stack.push(element)
         }
        
        var current: Int = Int.min
        for element in stack.array {
            if current > element { return false }
            else {
                current = element
            }
        }
        return true
    }
    
    
    
    // Creat BST From preorder triversal
    private func insertNode(_ node: Int, root: TreeNode?) -> TreeNode? {
        if root == nil {return TreeNode(node)}
        if node < root!.val {  root?.left = self.insertNode(node, root: root?.left)}
        else { root?.right = self.insertNode(node, root: root?.right) }
        return root
    }
    
    private func creatBST(input: [Int]) -> TreeNode? {
        if input.count == 0 {return nil}
        var root: TreeNode?
        for element in input {  root = self.insertNode(element, root: root) }
        return root
    }
    
    
}
