import UIKit

func calculateBodyMassindex(mass: Double, height: Double) -> String{
    let bmi = mass / (height * height)
    
    if bmi > 25.0{
        return "Overweight"
    }
    else if bmi >= 18.5 && bmi <= 25.0{
        return "Normal"
    }
    else{
        return "Underweight"
    }
}

print(calculateBodyMassindex(mass: 82, height: 1.82))
