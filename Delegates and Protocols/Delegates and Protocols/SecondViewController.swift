//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Plamen Kostadinov on 12/8/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var data: String?
    var delegate: CanReceive?
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }
    
    @IBAction func sendDataBackButton(_ sender: Any) {
        
        if let textBack = textField.text {
            if textBack.isEmpty {
                delegate?.dataReceived(data: "There is no data sent back :(")
            } else {
                delegate?.dataReceived(data: textBack)
                textField.text = ""
            }
        } else {
            delegate?.dataReceived(data: "There is no data sent back :(")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
