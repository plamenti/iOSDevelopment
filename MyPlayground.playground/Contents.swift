import Foundation



func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

add(n1: 2, n2: 3)

// Add is function of type:
// (Int, Int) -> Int
// So it could be used as argument in calculate function in order to inject its functionality
// Third parameter operation: (Int, Int) -> Int

func calculate(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

calculate(n1: 2, n2: 3, operation: add)

// Any function of type (Int, Int) -> Int could be used as argument in calculate function
// Example multiply
func multiply(n1: Int, n2:Int) -> Int {
    return n1 * n2
}

calculate(n1: 2, n2: 3, operation: multiply)

