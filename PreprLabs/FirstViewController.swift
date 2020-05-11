//
//  FirstViewController.swift
//  PreprLabs
//
//  Created by Sagar Bhatt on 2020-05-10.
//  Copyright © 2020 Sagar Bhatt. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func login (_ sender: UIButton) {
        if (username.text=="admin" && password.text=="admin") { performSegue(withIdentifier: "performSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Invalid login", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

