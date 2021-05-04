//
//  ViewController.swift
//  FUNFIT
//
//  Created by Prasanna Venkatesan on 23/03/2020.
//  Copyright © 2020 Prasanna Venkatesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startWorkout(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToWorkout", sender: self)
    }
    
}

