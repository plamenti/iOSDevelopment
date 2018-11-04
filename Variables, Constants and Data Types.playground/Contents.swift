import UIKit

// variables and constants can have explicitly given type, but this can be omitted

// variable
var myAge : Int = 32

myAge = 33

// constant
let myName : String = "Plamen"

let myFamilyName : String = "Kos"

// some kind like string interpolation
let myFullName = "\(myName) \(myFamilyName)"

// if variable of type Int is in string it is converted to string
let myDetails = "\(myFullName), \(myAge)"

let wholeNumbers : Int = 42
let text : String = "abc"
let booleans : Bool = true
let floatingNumbers : Float = 3.141592
let doubleNUmbers : Double = 3.141592653589793

// try to assign a new value to constant will cause error
let myConstant = 5
// next line will cause error
// myConstant = 7

