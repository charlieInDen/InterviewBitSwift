//
//  Spiral Order Matrix.swift
//  Vision
//
//  Created by OLX on 21/01/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation


class SpiralOrderMatrix {
    
    static let shared: SpiralOrderMatrix = SpiralOrderMatrix()
    
    private init () {
         
    }
}


extension SpiralOrderMatrix {
    
    func rotateMatrix(_ input: inout [[Int]], _ rowCount: Int, _ columeCount: Int)   {
        var columeStart: Int = 0
        var columeEnd: Int = columeCount-1
        var rowStart: Int = 0
        var rowEnd: Int = rowCount-1
        
        while columeStart <= columeEnd  && rowStart <= rowEnd  {
            for i in columeStart...columeEnd {
                print(input[rowStart][i])
            }
            rowStart += 1
            
            if rowStart < rowEnd {
                for i in rowStart...rowEnd {
                    print(input[i][columeEnd])
                }
                
                columeEnd -= 1
            }
            
            
            if columeEnd > columeStart {
                for i in stride(from: columeEnd, to: columeStart-1, by: -1) {
                    print(input[rowEnd][i])
                }
                
                rowEnd -= 1
            }
            
            if rowEnd > rowStart {
                for i in stride(from: rowEnd, to: rowStart-1, by: -1) {
                    print(input[i][columeStart])
                }
                columeStart += 1
            }
         }
    }

}
