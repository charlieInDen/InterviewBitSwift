//
//  Find Duplicate in Array.swift
//  Vision
//
//  Created by  on 28/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation



class FindDuplicate {
    
    static let shared: FindDuplicate  = FindDuplicate()
    
    private init () {
        let output = self.duplicate([1,3,100])
        print(output)
    }
}

extension FindDuplicate{
    
    func duplicate(_ nums: [Int]) -> Int {
        var input = nums
        for i in 0..<input.count {
            let index = abs(input[i])-1
            if input[index] < 0 {return index+1}
            input[index] = -input[index]
        }
        return 0
    }
}
