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

// Using subclass with optional that has value
let mySelfDrivingCar = SelfDrivingCar(customerChosenColor: "Orange", someDestination: "To the End of the World!")
mySelfDrivingCar.printCar()
mySelfDrivingCar.drive()

// Using subclass with optional that hasn't value
let mySecondSelfDrivingCar = SelfDrivingCar(customerChosenColor: "Grey")
mySecondSelfDrivingCar.printCar()
mySecondSelfDrivingCar.drive()
