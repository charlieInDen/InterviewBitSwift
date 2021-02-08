//
//  Balance Array.swift
//  Vision
//
//  Created by on 28/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class BalanceArray {
    
    static let shared: BalanceArray  = BalanceArray()
    
    private init () {
        let output = self.balanceArray([5, 5, 2, 5, 8])
        print(output)
    }
}

extension BalanceArray {
    
    
    //Answer is Correct but time limet excedded 
    func balanceArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {return 0}
        if nums.count == 1 {return 1}
        var output: Int = 0
        for i in 0..<nums.count {
            var input = nums
            input.remove(at: i)
            var oddSum: Int = 0
            var evenSum: Int = 0
            for index in 0..<input.count {
                if  index%2 == 0 {
                    oddSum += input[index]
                } else {
                    evenSum += input[index]
                }
            }
            if oddSum == evenSum {
                output += 1
            }
        }
        return output
    }
}
