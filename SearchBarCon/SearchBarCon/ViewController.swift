//
//  ViewController.swift
//  SearchBarCon
//
//  Created by Alexander Vuong on 5/4/19.
//  Copyright © 2019 Alexander Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let clubNameArr = ["Akbayan", "Key Club", "VSA", "American Association of Airport Executives", "Society of Women Engineers", "American Society of Civil Engineers"]
    
    var searchClub = [String]()
    var searching = false

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
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

extension ViewController: UISearchBarDelegate {
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



