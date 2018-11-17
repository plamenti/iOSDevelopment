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
    var color: String
    var numberOfSeats: Int
    var typeOfCar: CarType
    
    // Designated initializer
    init() {
        self.color = "Black"
        numberOfSeats = 5
        typeOfCar = .Coupe
    }
    
    // Convenience initializar
    convenience init(customerChosenColor: String){
        self.init()
        self.color = customerChosenColor
    }
    
    func printCar() -> Void {
        print(self.color)
        print(self.numberOfSeats)
        print(self.typeOfCar)
    }
}
