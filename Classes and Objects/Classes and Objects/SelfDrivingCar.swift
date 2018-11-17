//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Plamen Kostadinov on 11/17/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    
    var destination: String
    
    override init(){
        self.destination = "The End of The World"
    }
    
    // Override methods from super class
    override func drive() {
        super.drive()
        print("\(self.color) self driving car is moving to \(self.destination)")
    }
}
