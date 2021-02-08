//
//  Minimum Lights to Activate.swift
//  Vision
//
//  Created by  on 21/01/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation


class MinimumLightsToActivate {
    
    static let shared: MinimumLightsToActivate = MinimumLightsToActivate()
    
    private init () {
        let output = self.minimumLightsToActivate([ 0, 0, 1, 1, 1, 0, 0, 1], 3)
        print(output)
    }
}


extension MinimumLightsToActivate{
    
    
    private func minimumLightsToActivate(_ input: [Int], _ size: Int) -> Int {
        //[ X-B+1, X+B-1].
        
        var output: [Int] = input
        
        for index in input {
            if input[index] == 0 && index-size+1 >= 0 {
                output[index-size+1] = 1
            }
            if input[index] == 0 && index+size-1 < input.count {
                output[index+size-1] = 1
            }
        }
        
        let result = output.split(separator: 1)
        print(result)
        return 0
     }
}
