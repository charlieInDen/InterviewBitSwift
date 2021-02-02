//
//  Maximum Gap.swift
//  Vision
//
//  Created by OLX on 28/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class MaximumGap {
    
    static let shared: MaximumGap  = MaximumGap()
    
    private init () {
        let output = self.maximumGap([1,3,100])
        print(output)
    }
}

extension MaximumGap{
    
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {return 0}
        var max_so_far: Int = Int.min
        var min_so_far: Int = Int.max
        for index in nums {
            max_so_far = max(max_so_far,index)
            min_so_far = min(min_so_far,index)
        }
        let delta = ceil(Double(max_so_far-min_so_far)/Double(nums.count-1))
        var max_bucket: [Int] = Array(repeating: Int.min, count:nums.count-1)
        var min_bucket: [Int] = Array(repeating: Int.max, count:nums.count-1)
        for element in nums {
            if element == max_so_far || element == min_so_far {continue}
            let index = Int(Double((element-min_so_far))*1.0/delta)
            max_bucket[index] = max(max_bucket[index],element)
            min_bucket[index] = min(min_bucket[index],element)
        }
        var lenth: Int = 0
        var previous: Int = min_so_far
        for index in 0..<min_bucket.count {
            if min_bucket[index] == Int.max && max_bucket[index] == Int.min {continue}
            lenth = max(lenth, min_bucket[index]-previous)
            previous = max_bucket[index]
        }
        lenth = max(lenth, max_so_far-previous)
        return lenth
    }
}
