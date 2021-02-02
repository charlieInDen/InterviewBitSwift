//
//  Pick from both sides.swift
//  Vision
//
//  Created by OLX on 21/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class PickFromBothSide {
    
    static let shared: PickFromBothSide = PickFromBothSide()
    
    private init () {
        let output = self.maximumPossibleSum([5, -2, 3 , 1, 2], 3)
        print(output)
    }
}


extension PickFromBothSide{
    
    private func maximumPossibleSum(_ input: [Int], _ size: Int) -> Int {
        var left_Sum: Int = 0
        var right_Sum: Int = 0
        var max_sum: Int = 0
        let total_size: Int = input.count
        for index in 0..<size {
            left_Sum += input[index]
        }
        max_sum = left_Sum+right_Sum
        for i in 0..<size {
            left_Sum -= input[size-i]
            right_Sum += input[total_size-1-i]
            max_sum = max(max_sum, left_Sum+right_Sum)
        }
        return max_sum
    }
}
