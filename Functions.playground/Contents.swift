// create a parameterless function
func getMilk(){
    print("go to the shops")
    print("buy 2 cartons of milk")
    print("pay")
    print("come home")
}

//execute the function
getMilk()

// create function with parameters
func getMilk(howManyMilkCartons : Int){
    print("go to the shops")
    print("buy \(howManyMilkCartons) cartons of milk")
    let priceToPay = howManyMilkCartons * 2
    print("pay $\(priceToPay)")
    print("come home")
}

getMilk(howManyMilkCartons: 5)

// create functions that return result
func getMilkWithChange(howManyMilkCartons : Int, howMuchMoneyRobotHasGiven : Int) -> Int{
    print("go to the shops")
    print("buy \(howManyMilkCartons) cartons of milk")
    let priceToPay = howManyMilkCartons * 2
    print("pay $\(priceToPay)")
    print("come home")
    let change = howMuchMoneyRobotHasGiven - priceToPay
    
    return change
}

var amountOfChange = getMilkWithChange(howManyMilkCartons: 4, howMuchMoneyRobotHasGiven: 10)

print("Hello master, here's your $\(amountOfChange) change")
