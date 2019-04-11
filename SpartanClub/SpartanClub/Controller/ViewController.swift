//
//  ViewController.swift
//  SpartanClub
//
//  Created by Tan  Manh on 3/13/19.
//  Copyright © 2019 Group 2. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var emailFilled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func regisButt(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRegis", sender: self)
    }
    @IBAction func Login(_ sender: UIButton) {
        FIRAuth.auth()?.signIn(withEmail: emailFilled.text!, password: pass.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
                return
            }
            
            else{
                print("Login successful")
                self.performSegue(withIdentifier: "goToMainPage", sender: self)
            }
        })
        
    }
}

