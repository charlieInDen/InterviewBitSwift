//
//  Perfect Peak of Array.swift
//  Vision
//
//  Created by OLX on 21/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class PerfectPeakofArray {
    
    static let shared: PerfectPeakofArray = PerfectPeakofArray()
    
    private init () {
        let output = self.perfectPeak([ 9488, 25784, 5652, 9861, 31311, 8611, 1671, 7129, 28183, 2743, 11059, 4473, 7927, 21287, 2259, 7214, 32529]
)
        print(output)
    }
}


extension PerfectPeakofArray{
    
    private func perfectPeak(_ input: [Int]) -> Int {
        
        var max_so_far: Int = Int.min
        var min_so_far: Int = Int.max
        
        
        let lastIndex: Int = input.count-1
        var leftOutput: [Int] = Array(repeating: Int.min, count: lastIndex+1)
        var rightOutput: [Int] = Array(repeating: Int.max, count: lastIndex+1)
        
        for index in 1..<input.count {
            max_so_far = max(max_so_far, input[index-1])
            min_so_far = min(min_so_far, input[lastIndex-index+1])
            leftOutput[index] = max_so_far
            rightOutput[lastIndex-index] = min_so_far
        }
        
        for index in 1..<leftOutput.count {
            if input[index] > leftOutput[index] && input[index] < rightOutput[index] {return 1}
        }
        
        return 0
    }
}
