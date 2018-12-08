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
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }
    
    @IBAction func sendDataBackButton(_ sender: Any) {
    }
}
