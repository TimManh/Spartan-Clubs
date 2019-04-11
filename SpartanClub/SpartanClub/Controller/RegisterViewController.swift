//
//  RegisterViewController.swift
//  SpartanClub
//
//  Created by Tan  Manh on 4/4/19.
//  Copyright © 2019 Group 2. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var userText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Register(_ sender: UIButton) {
        FIRAuth.auth()?.createUser(withEmail: userText.text!, password: pass.text!, completion: { (user, error) in
            
            if error != nil{
                print(error!)
            }
            
            else{
//                success
                print("Registration Successful")
                self.performSegue(withIdentifier: "goToMainPage1", sender: self)
            }
        })
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToMainPage"{
//            let destinationVC = segue.destination as! MainPageViewController
//            destinationVC.textPassedOver = userText.text!
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
