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

// Loop through some range by condition
// From ... to inclusive
for number in 1...10 where number % 2 == 0{
    print(number)
}

// Generate lyrics of the song 99 Bottles of Bear
// 99 bottles of beer on the wall, 99 bottles of beer.
// Take one down and pass it around, 98 bottles of beer on the wall.

func generateLyricsOf99BottlesOfBeer(){
    let beers = 99
    
    for beer in (1...beers).reversed(){
        let bottle = beer != 1 ? "bottles":"bottle"
        print("\(beer) \(bottle) of beer on the wall, \(beer) \(bottle) of beer.")
        if beer > 1 {
            print("Take one down and pass it around, \(beer - 1) bottles of beer on the wall.")
        }
        else{
            print("Take one down and pass it around, no more bottles of beer on the wall.")
        }
    }
    
    print("No more bottles of beer on the wall, no more bottles of beer.")
    print("Go to the store and buy some more, \(beers) bottles of beer on the wall.")
}

generateLyricsOf99BottlesOfBeer()
