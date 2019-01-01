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

// Closures
// Closures are anonymous functions
// To convert a function to closure:
// 1. Remove 'func' keyword
// 2. Remove the name of the function
// 3. Move open curly bracket at the front of the line
// 4. Put 'in' keyword after the return type of the function
// 5. Use it as argument
// Example with calculate function - add substraction functionality:

func substract(n1: Int, n2: Int) -> Int {
    return n1 - n2
}
// Sustract function as closure
// { (number1: Int, number2: Int) -> Int in
//    return n1 - n2
//}

// Use it in calculate function
calculate(n1: 3, n2: 2, operation: {
    (number1: Int, number2: Int) -> Int in
    return number1 - number2
})


