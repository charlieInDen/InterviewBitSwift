//
//  Sort array with squares!.swift
//  Vision
//
//  Created by OLX on 01/02/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class SortArrayWithSquares {
    
    static let shared: SortArrayWithSquares  = SortArrayWithSquares()
    
    private init () {
        let output = self.sortArrayWithSquares([-6, -3, -1, 2, 4, 5])
        print(output)
    }
}

extension SortArrayWithSquares {
    
    
    //Answer is Correct but time limet excedded
    func sortArrayWithSquares(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {return []}
        if nums.count == 1 {return [nums[0]*nums[0]]}
        var output: [Int] = Array(repeating: 0, count: nums.count)
        var start: Int = 0
        var end: Int = nums.count-1
        var index: Int = nums.count-1
        while start <= end && index >= 0 {
            let startSquere = nums[start]*nums[start]
            let endSquere = nums[end]*nums[end]
            
            if startSquere > endSquere {
                output[index] = startSquere
                start += 1
            } else if startSquere < endSquere {
                output[index] = endSquere
                end -= 1
            } else {
                output[index] = startSquere
                index -= 1
                if index < 0 { return output }
                output[index] = endSquere
                start += 1
                end -= 1
            }
            index -= 1
        }
        return output
    }
}
