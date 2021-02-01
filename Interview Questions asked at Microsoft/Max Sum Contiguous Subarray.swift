//
//  Max Sum Contiguous Subarray.swift
//  Leetcode
//
//  Created by Nishant on 01/02/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

class MaxSumSolution {
    func maximum(a: Int, b: Int) -> Int {
        return a > b ? a : b
    }
    func maxSubArray(_ a: [Int]) -> Int {
        var sum = 0
        var maxSum = -1001
        for i in 0..<a.count {
            sum = maximum(a: a[i], b: a[i] + sum)
            if maxSum < sum {
                maxSum = sum
            }
        }
        return maxSum
    }
}
