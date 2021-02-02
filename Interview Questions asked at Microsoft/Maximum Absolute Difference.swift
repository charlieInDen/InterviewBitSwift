//
//  Maximum Absolute Difference.swift
//  Vision
//
//  Created by OLX on 21/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class MaximumAbsoluteDifference {
    
    static let shared: MaximumAbsoluteDifference = MaximumAbsoluteDifference()
    
    private init () {
        let output = self.maximumAbsoluteDifference([1, 3, -1])
        print(output)
    }
}

extension MaximumAbsoluteDifference{
    
    private func maximumAbsoluteDifference(_ input: [Int]) -> Int {
        if input.count == 0 {return 0}
        var idiffmax: Int = Int.min
        var idiffmin: Int = Int.max
        var jdiffmax: Int = Int.min
        var jdiffmin: Int = Int.max
        
        for index in 0..<input.count {
            idiffmax = max(input[index]+index, idiffmax)
            idiffmin = min(input[index]+index, idiffmin)
            jdiffmax = max(input[index]-index, jdiffmax)
            jdiffmin = min(input[index]-index, jdiffmin)
        }
        return max(idiffmax-idiffmin, jdiffmax-jdiffmin)
    }
}
