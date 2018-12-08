//
//  ViewController.swift
//  Segues
//
//  Created by Plamen Kostadinov on 12/8/18.
//  Copyright © 2018 plamenti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    
}
