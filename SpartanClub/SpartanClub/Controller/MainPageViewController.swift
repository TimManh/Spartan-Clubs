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
    
    let clubNameArr = ["Akbayan", "Key Club", "VSA", "American Association of Airport Executives", "Society of Women Engineers", "American Society of Civil Engineers","Active minds SJSU", "Advancement Institute for Management","AICHE","AIESEC","ALMAS","ASCE","SCE"]
    
    var searchClub = [String]()
    var searching = false
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    //    let clubs = ["AIESEC","ALMAS","BSU","BRAVEN","SCE","CRU"]

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
extension MainPageViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchClub.count
        }else {
            return clubNameArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchClub[indexPath.row]
        }else {
            cell?.textLabel?.text = clubNameArr[indexPath.row]
        }
        return cell!
    }
}

extension MainPageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchClub = clubNameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tblView.reloadData()
    }
}


