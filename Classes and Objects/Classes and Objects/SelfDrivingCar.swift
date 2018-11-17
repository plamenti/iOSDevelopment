//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Plamen Kostadinov on 11/17/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    
    // Optional
    var destination: String?
    
    override init() {
        // self.destination = "The End of The World"
    }
    
    convenience init(someDestination: String) {
        self.init()
        self.destination = someDestination
    }
    
    convenience init(customerChosenColor: String, someDestination: String) {
        self.init(customerChosenColor: customerChosenColor)
        self.destination = someDestination
    }
    
    // Override methods from super class
    override func drive()
    {
        if let userSetDestination = destination{
            print("\(self.color) self driving car is moving to \(userSetDestination)")
        }
        else{
            super.drive()
        }
    }
}
