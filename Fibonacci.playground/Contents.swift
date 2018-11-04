import UIKit

func printFibonacciNumbers(maxNumber : UInt){
    var firstNumber = 0
    var secondNumber = 1
    var result = ""
    
    if maxNumber == firstNumber{
        result += String(firstNumber)
        print(result)
    }
    else if maxNumber == secondNumber{
        result += String(firstNumber) + ", " + String(secondNumber)
        print("\(firstNumber), \(secondNumber)")
    }
    else{
        result += String(firstNumber) + ", " + String(secondNumber)
        var currentNumber = firstNumber + secondNumber
        
        while currentNumber < maxNumber{
            result += ", " + String(currentNumber)
            firstNumber = secondNumber
            secondNumber = currentNumber
            currentNumber = firstNumber + secondNumber
        }
        
        print(result)
    }
}

printFibonacciNumbers(maxNumber: 2000)
