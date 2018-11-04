import UIKit

let arrayOfNumbers = [1, 5, 32, 21, 8, 2];

for number in arrayOfNumbers{
    print(number)
    print("new cicle")
}

// Calculate sum of the array
var sum = 0

for number in arrayOfNumbers{
    sum += number
}

print(sum)

// Loop through some range
// From ... to inclusive
for number in 1...10 {
    print(number)
}

// Loop through some range
// From ... to exclusive
for number in 1..<10 {
    print(number)
}
