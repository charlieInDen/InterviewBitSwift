//
//  Merge Intervals.swift
//  Vision
//
//  Created by OLX on 21/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class MergeIntervals {
    
    static let shared: MergeIntervals = MergeIntervals()
    
    private init () {
        let output = self.mergeIntervals([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,9])
        print(output)
    }
}

extension MergeIntervals{
    
    private func mergeIntervals(_ input: [[Int]], _ interval: [Int]) -> [Int] {
        if interval.count == 0 {return []}
        var ouptut: [[Int]] = input
        
        for index in 0..<ouptut.count {
            if ouptut[index][0] > interval[0] {
                ouptut.insert(interval, at: index)
                break
            }
        }
        
        var stack: Stack<Int> = Stack()
        stack.push(input[0][0])
        stack.push(input[0][1])
        
        for index in 1..<ouptut.count {
            let top = stack.top!
            
            if top > ouptut[index][0] {
                let pop = stack.pop()!
              //  stack.push(ouptut[index][0])
                if pop < ouptut[index][1] {
                    stack.push(ouptut[index][1])
                } else {
                    stack.push(pop)
                }
            } else {
                stack.push(ouptut[index][0])
                stack.push(ouptut[index][1])
            }
            
        }
        
        print(stack.array)
        
        return stack.array
         
    }
}
