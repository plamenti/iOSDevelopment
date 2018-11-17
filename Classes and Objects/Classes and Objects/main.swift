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

// Assign value to property
myCar.color = "Red";
myCar.printCar()

// Using convenience initializer
let someRichGuyCar = Car(customerChosenColor: "Gold")
someRichGuyCar.printCar()
