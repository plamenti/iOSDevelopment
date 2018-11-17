//
//  main.swift
//  Classes and Objects
//
//  Created by Plamen Kostadinov on 11/15/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import Foundation

let myCar = Car(customerChosenColor: "Green")
myCar.printCar()
myCar.drive()

// Assign value to property
myCar.color = "Red";
myCar.printCar()
myCar.drive()

// Using convenience initializer
let someRichGuyCar = Car(customerChosenColor: "Gold")
someRichGuyCar.printCar()
someRichGuyCar.drive()

// Using subclass
let mySelfDrivingCar = SelfDrivingCar()
mySelfDrivingCar.printCar()
mySelfDrivingCar.drive()
