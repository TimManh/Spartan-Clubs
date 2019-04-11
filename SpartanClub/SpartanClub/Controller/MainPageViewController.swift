//
//  MainPageViewController.swift
//  SpartanClub
//
//  Created by Tan  Manh on 4/3/19.
//  Copyright © 2019 Group 2. All rights reserved.
//

import UIKit
import Firebase
class MainPageViewController: UIViewController {
    var textPassedOver : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        do{
            try FIRAuth.auth()?.signOut()}
        catch{
            print("Error:problem with sign out")
        }
        guard ((navigationController?.popToRootViewController(animated: true)) != nil)
            else{
                print("No view Controllers to pop off")
                return
        }

    }
    
    @IBAction func ClubName(_ sender: Any) {
          performSegue(withIdentifier: "gotoOneClub", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
