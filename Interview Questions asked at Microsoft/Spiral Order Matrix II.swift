//
//  Spiral Order Matrix II.swift
//  Leetcode
//
//  Created by Nishant on 01/02/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

class SpiralIISolution {
    func generateMatrix(_ A: inout Int) -> [[Int]] {
        let n = A*A
        let arr = Array(1...n)
        let row: Int = A
        let col: Int = A
        /// Base condition
        var result:[[Int]] = [[Int]]()
        guard  arr.isEmpty == false else { return result }
        /// Logic
        for _ in 0..<row {
            result.append(Array(repeating: 0, count: col))
        }
        
        var r1 = 0, c1 = 0
        var r2 = row - 1, c2 = col - 1
        var i = 0
        while r1 <= r2 && c1 <= c2 {
            /// Go from c1 to c2 and append the element
            for c in stride(from: c1, through: c2, by: 1) {
                result[r1][c] = arr[i]
                i = i + 1
                /// 1,2,3
            }
            /// Go from next row till endof row
            for r in stride(from: r1 + 1, through: r2, by: 1) {
                result[r][c2] = arr[i]
                i = i + 1
            }
            
            if r1 < r2 && c1 < c2 {
                /// Move from c2-1 till c1
                for c in stride(from: c2 - 1, through: c1, by: -1) {
                    result[r2][c] = arr[i]
                    i = i + 1
                }
                /// Move from r2-1 till r1
                for r in stride(from: r2 - 1, to: r1, by: -1) {
                    result[r][c1] = arr[i]
                    i = i + 1
                }
            }
            r1 = r1 + 1
            r2 = r2 - 1
            c1 = c1 + 1
            c2 = c2 - 1
        }
        return result
    }
}
