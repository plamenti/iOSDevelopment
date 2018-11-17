//
//  Car.swift
//  Classes and Objects
//
//  Created by Plamen Kostadinov on 11/15/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car{
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar: CarType = .Coupe
    
    init(customerChosenColor: String) {
        self.color = customerChosenColor
    }
}
