//
//  Add One To Number.swift
//  Leetcode
//
//  Created by Nishant on 02/02/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

class AddSolution {
    func plusOne(_ A: inout [Int]) -> [Int] {
                var isInitialRemoveRequire = true

        A = A.filter{
        if $0 == 0 && isInitialRemoveRequire {
        return false
        }else {
            isInitialRemoveRequire = false
            return true
        }
        }
        var res = [Int](), carry = 0
        var i = A.count - 1, k = 1
        while i >= 0 || k > 0 || carry > 0 {
            let valA = i >= 0 ? A[i] : 0
            let valB = k % 10
            let val = valA + valB + carry
            res.append(val % 10)
            carry = val / 10
            i -= 1
            k /= 10
        }
        
            
        return res.reversed()
    }
}
