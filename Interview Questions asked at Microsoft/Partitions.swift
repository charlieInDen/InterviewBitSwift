//
//  Partitions.swift
//  Vision
//
//  Created by OLX on 21/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class Partitions {
    
    static let shared: Partitions = Partitions()
    
    private init () {
        let output = self.partitions([1, 2, 3, 0, 3])
        print(output)
    }
}

extension Partitions{
    
    private func partitions(_ input: [Int]) -> Int {
        let lastIndex: Int = input.count-1
        var prefix: [Int] = []
        var suffix: [Int] = []
        var sum: Int = 0
        for i in input { sum += i }
        if sum%3 != 0 {return 0}
        let partion: Int = sum/3
        var prefixsum = 0
        var sufixsum = 0
        for index in 0..<input.count {
            prefixsum += input[index]
            if prefixsum == partion {  prefix.append(index) }
            sufixsum += input[lastIndex-index]
            if sufixsum == partion {  suffix.append(lastIndex-index) }
        }
        
        var output: Int = 0
        for prefixIndex in prefix {
            for sufixIndex in suffix {
                if prefixIndex+1 > sufixIndex-1 {continue}
                var sum_so_far:Int = 0
                
                for index in prefixIndex+1...sufixIndex-1 {
                    sum_so_far += input[index]
                }
                
                if sum_so_far == partion {output += 1}
            }
        }
 
        return output
    }
}
