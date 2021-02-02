//
//  Max Distance.swift
//  Vision
//
//  Created by OLX on 01/02/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class MaxDistance {
    
    static let shared: MaxDistance  = MaxDistance()
    
    private init () {
        let output = self.maxDistance([ -1, -1, 2])
        print(output)
    }
}

extension MaxDistance {
    
    func maxDistance(_ nums: [Int]) -> Int {
        if nums.count <= 1 {return 0}
        var leftMin: [Int] = Array(repeating: 0, count: nums.count)
        var rightMax: [Int] = Array(repeating: 0, count: nums.count)
        let lastIndex = nums.count-1
        leftMin[0] = nums[0]
        rightMax[lastIndex] = nums[lastIndex]
        
        
        for index in 1..<nums.count {
            leftMin[index] = min(nums[index], leftMin[index-1])
            rightMax[lastIndex-index] = max(nums[index], rightMax[lastIndex-index+1])
        }
        var maxDistance: Int = 0
        var i: Int = 0
        var j: Int = 0
        while i < nums.count, j < nums.count {
            if leftMin[i] <= rightMax[j] {
                maxDistance = max(j-i, maxDistance)
                j += 1
            } else {
                i += 1
            }
        }
        return maxDistance
    }
}
