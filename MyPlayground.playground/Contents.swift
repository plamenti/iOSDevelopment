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

// Infer Closure - remove type of the variables in Closure
calculate(n1: 3, n2: 2, operation: {
    (number1, number2) -> Int in
    return number1 - number2
})

// Infer Closure - remove return type of Closure
calculate(n1: 3, n2: 2, operation: {
    (number1, number2) in
    return number1 - number2
})

// Infer Closure - remove return in Closure
calculate(n1: 3, n2: 2, operation: {
    (number1, number2) in
    number1 - number2
})

// Substitute parameters in Closure with anonymous parameters
// In Swift first parameter is $0, second parameter is $1 and etc
// Infer Closure - use anonymous parameters in Closure
calculate(n1: 3, n2: 2, operation: {
    $0 - $1
})

// Infer Closure - use Trailing Closure
// In Swift if the last parameter in a function is a Closure, last parameter name could be ommitted
// and Closure could be put trailing at the end - Trailing Closure
let result = calculate(n1: 3, n2: 2) { $0 - $1 }
print(result)
