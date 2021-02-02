//
//  Repeat and Missing Number Array.swift
//  Vision
//
//  Created by OLX on 01/02/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class RepeatingMissingNumber {
    
    static let shared: RepeatingMissingNumber  = RepeatingMissingNumber()
    
    private init () {
        let output = self.repeatingMissingNumber([3, 1, 2, 5, 3])
        print(output)
    }
}

extension RepeatingMissingNumber {
    
    // second Aproach
    func repeatingMissingNumber(_ A: [Int]) -> [Int] {
        var output: [Int] = Array(repeating: 0, count: A.count+1)
        for i in A {
            output[i] =  output[i] + 1
        }
        
        var repeated: Int = 0
        var missing: Int = 0
        
        for i in 1..<output.count {
            if output[i] == 2 {
                repeated = i
            }
            
            if output[i] == 0 {
                missing = i
            }
        }
        
        return [repeated, missing]
    }
}
