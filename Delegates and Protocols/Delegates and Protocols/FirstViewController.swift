//
//  ViewController.swift
//  Delegates and Protocols
//
//  Created by Plamen Kostadinov on 12/8/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSecondScreen" {
            
            let secondVC = segue.destination as! SecondViewController
            
            if let dataToSend = textField.text {
                if dataToSend.isEmpty {
                    secondVC.data = "There is no data to send :("
                } else {
                    secondVC.data = dataToSend
                }
            }
            
            textField.text = ""
            
            secondVC.delegate = self
        }
    }
    
    func dataReceived(data: String) {
        label.text = data
    }
}

