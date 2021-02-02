//
//  N:3 Repeat Number.swift
//  Vision
//
//  Created by OLX on 01/02/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class RepeatingNumber {
    
    static let shared: RepeatingNumber  = RepeatingNumber()
    
    private init () {
        let output = self.repeatingNumber([1 ,2 ,3 ,1 ,1])
        print(output)
    }
}

extension RepeatingNumber {
    
    func repeatingNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {return -1}
        var firstNumber: Int = Int.min
        var firstCount: Int = 0
        var secondNumber: Int = Int.min
        var secondCount: Int = 0
        
        
        for index in nums {
            if index == firstNumber {
                firstCount += 1
            } else if index == secondNumber {
                secondCount += 1
            } else if firstCount == 0 {
                firstNumber = index
                 firstCount += 1
            } else if secondCount == 0  {
                secondNumber = index
                secondCount += 1
            } else {
                firstCount -= 1
                secondCount -= 1
            }
        }
        
        var count1: Int = 0
        var count2: Int = 0
        
        for index in nums {
            if index == firstNumber {
                count1 += 1
            } else if index == secondNumber {
                count2 += 1
            }
        }
        
        if count1 > nums.count/3 {return firstNumber}
        if count2 > nums.count/3 {return secondNumber}
        return -1
     }
}
