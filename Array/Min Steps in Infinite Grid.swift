//
//  Min Steps in Infinite Grid.swift
//  Vision
//
//  Created by  on 21/01/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation


class MinStepsInInfiniteGrid {
    
    static let shared: MinStepsInInfiniteGrid = MinStepsInInfiniteGrid()
    
    private init () {
        let output = self.minStepsInInfiniteGrid([0, 1, 1], [0, 1, 2])
        print(output)
    }
}


extension MinStepsInInfiniteGrid{
    
    
    private func minStepsInInfiniteGrid(_ xCoordinate: [Int], _ yCoordinate: [Int]) -> Int {
        if xCoordinate.count != yCoordinate.count {return 0}
        if xCoordinate.count == 1 {return 0}
        var lastx: Int = xCoordinate[0]
        var lasty: Int = yCoordinate[0]
        var distance_so_far: Int = 0
        for i in 1..<xCoordinate.count {
            distance_so_far = distance_so_far + max(abs(lastx-xCoordinate[i]) , abs(lasty-yCoordinate[i]))
            lastx = xCoordinate[i]
            lasty = yCoordinate[i]
        }
        return distance_so_far
    }
}
