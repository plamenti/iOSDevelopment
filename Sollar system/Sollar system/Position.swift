//
//  Position.swift
//  Sollar system
//
//  Created by Plamen Kostadinov on 29.12.18.
//  Copyright © 2018 Plamen Kostadinov. All rights reserved.
//

import Foundation

class Position {
    private let x: Float
    private let y: Float
    private let z: Float
    
    init(x: Float, y: Float, z:Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    var X: Float {
        return self.x
    }
    
    var Y: Float {
        return self.y
    }
    
    var Z: Float {
        return self.z
    }
}
