//
//  First Missing Integer.swift
//  Vision
//
//  Created by  on 01/02/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation



class FirstMissingInteger {
    
    static let shared: FirstMissingInteger  = FirstMissingInteger()
    
    private init () {
        let output = self.firstMissingInteger([-8, -7, -6])
        print(output)
    }
}

extension FirstMissingInteger {
    
    func firstMissingInteger(_ nums: [Int]) -> Int {
        if nums.count == 0 {return 1}
        var output: [Int] = Array(repeating: 0, count: nums.count+1)
        for element in nums {
            if element > 0 && element < output.count {
                output[element] = 1
            }
        }
        
        for index in 1..<output.count {
            if output[index] == 0 {
                return index
            }
        }
        return output.count
    }
 }
