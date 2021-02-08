//
//  Maximum Sum Triplet.swift
//  Vision
//
//  Created by  on 21/01/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

// Need to solve 
class MaximumSumTriplet {
    
    static let shared: MaximumSumTriplet = MaximumSumTriplet()
    
    private init () {
        let output = self.maximumSumTriplet([2, 5, 3, 1, 4, 9])
        print(output)
    }
}


extension MaximumSumTriplet{
    
    
    private func maximumSumTriplet(_ input: [Int]) -> Int {
        if input.count < 3 {return 0}
        let lastIndex = input.count-1
        var max_so_far: Int = Int.min
        for i in 1..<lastIndex-1 {
            let mid: Int = input[i]
            
            var leftMax = Int.min
            for start in 0..<i {
                if input[start] < mid {
                    leftMax = max(leftMax, input[start])
                }
            }
            
            var rightMax = Int.min
            
            for end in i+1...lastIndex {
                if input[end] > mid {
                    rightMax = max(rightMax, input[end])
                }
            }
            
            if leftMax != Int.min && rightMax != Int.min {
                max_so_far = max(max_so_far, leftMax+rightMax+mid)
            }
        }
        return max_so_far
    }
}
