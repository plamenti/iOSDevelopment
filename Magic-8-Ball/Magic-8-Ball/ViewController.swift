//
//  ViewController.swift
//  Magic-8-Ball
//
//  Created by Plamen Kostadinov on 3.11.18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // can be created using short version let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    let ballArray : [String] = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber : Int = 0
    
    @IBOutlet weak var ballImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newBallImage()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }
    
    func newBallImage(){
        randomBallNumber = generateRandomNumber(upperBound: 4)
        ballImage.image = UIImage(named: ballArray[randomBallNumber])
        
        // another variation is creating the name with string interpolation
        // ballImage.image = UIImage(named: "ball\(randomBallNumber+1)")
    }
    
    func generateRandomNumber(upperBound : Int) -> Int{
        return Int.random(in: 0...upperBound)
    }
}

