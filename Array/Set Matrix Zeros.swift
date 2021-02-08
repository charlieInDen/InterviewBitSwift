//
//  Set Matrix Zeros.swift
//  Vision
//
//  Created by  on 01/02/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation


class SetMatrixZeros {
    
    static let shared: SetMatrixZeros  = SetMatrixZeros()
    
    private init () {
        let output = self.setMatrixZeros([[1, 0, 1],[1, 1, 1],[1, 1, 1]])
        print(output)
    }
}

extension SetMatrixZeros {
    
    
    //Answer is Correct but time limet excedded
    func setMatrixZeros(_ nums: [[Int]]) -> [[Int]] {
        var output: [[Int]] = nums
        var zeroRows: [Int] = Array(repeating: 0, count: nums.count)
        var zeroColums: [Int] = Array(repeating: 0, count: nums.count)
        for row in 0..<nums.count {
            for colume in 0..<nums[row].count {
                if nums[row][colume] == 0 {
                    zeroRows[row] = -1
                    zeroColums[colume] = -1
                }
            }
        }
        
        for row in 0..<nums.count {
            for colume in 0..<nums[row].count {
                if zeroRows[row] == -1 || zeroColums[colume] == -1 {
                    output[row][colume] = 0
                }
            }
        }
        return output
        
     }
}
