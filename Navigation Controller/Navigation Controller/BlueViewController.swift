//
//  ViewController.swift
//  Navigation Controller
//
//  Created by Plamen Kostadinov on 1.01.19.
//  Copyright © 2019 Plamen Kostadinov. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func navigateToYellowView(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToYellowViewController", sender: self)
    }
    
}

