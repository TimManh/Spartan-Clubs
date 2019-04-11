//
//  OneClubViewController.swift
//  SpartanClub
//
//  Created by Tan  Manh on 4/5/19.
//  Copyright © 2019 Group 2. All rights reserved.
//

import UIKit
import Firebase
import EventKit
class OneClubViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{

 
    @IBOutlet var messageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTableView.delegate = self
        messageTableView.dataSource = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(handleLogout))
        
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")

        // Do any additional setup after loading the view.

    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomTableViewCell
        
        let messageArray = ["First Message", "Second Message", "Third Message"]
        
        cell.MessageInfo.text = messageArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

//    func configureTableVeiw(){
//        UITableVIEWau
//        
//    }
//
//        let eventStore:EKEventStore = EKEventStore()
//        
//        eventStore.requestAccess(to: .event) {(granted,error) in
//            
//            if (granted) && (error == nil){
//                print("granted \(granted)")
//                print(error!)
//                
//                let event:EKEvent = EKEvent(eventStore: eventStore)
//                event.title = "Add event testing Title"
//                event.startDate = Date()
//                event.endDate = Date()
//                event.notes = "This is note"
//                event.calendar = eventStore.defaultCalendarForNewEvents
//                do{
//                    
//                    try eventStore.save(event, span: .thisEvent)
//                    
//                }catch let error as NSError{
//                    
//                    print("error: \(error)")
//                    
//                }
//                print("Save Event")
//            }else{
//                print(error!)
//            }
//            
//        }
//    }
    @objc func handleLogout(){
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
    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
