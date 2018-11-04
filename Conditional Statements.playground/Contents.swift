import UIKit

func loveCalculator(yourName : String, theirName : String) -> String {
    let loveScore = Int.random(in: 0...100)
    
    if(loveScore > 80){
        return "You love score is \(loveScore). You love each other!"
    }
    else if loveScore > 40 && loveScore <= 80{
        return "You love score is \(loveScore). You are together like coke and mentos!"
    }
    else{
        return "You love score is \(loveScore). No love possible!"
    }
}

print(loveCalculator(yourName: "John", theirName: "Jane"))
