//
//  Max Min.swift
//  Vision
//
//  Created by  on 21/01/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation


class MaxMin {
    
    static let shared: MaxMin = MaxMin()
    
    private init () {
        let output = self.maxminSum([-2, 1, -4, 5, 3])
        print(output)
    }
}

extension MaxMin{
    
    private func maxminSum(_ input: [Int]) -> Int {
        if input.count == 0 {return 0}
        var maxElement: Int = Int.min
        var minElement: Int = Int.max
        for index in 0..<input.count {
            maxElement = max(maxElement, input[index])
            minElement = min(minElement, input[index])
        }
        return maxElement + minElement
    }
}
