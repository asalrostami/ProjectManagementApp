//
//  ProjectTrackingViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class ProjectTrackingViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
     var projectName = ["asalPro" , "siamakPro" , "JuliePro" , "aPro","bPro","cpro"]
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var projectStartDateLbl: UILabel!
    
    @IBOutlet weak var projectFinishDateLbl: UILabel!
    
    @IBOutlet weak var numOfToDoTaskLbl: UILabel!
    @IBOutlet weak var numOfInProgressLbl: UILabel!
    
    
    @IBOutlet weak var numOfDoneTaskLbl: UILabel!
    
    
    @IBOutlet weak var tasksTableView: UITableView!

    
    @IBOutlet weak var durationOfTaskLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.delegate = self
        tasksTableView.dataSource = self


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskDashboard", for: indexPath) as! ProjectTrackingTableViewCell
        
        let proName = projectName[indexPath.row]
        
        cell.taskNameLblCell.text = proName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let message = messages[indexPath.row]
        //
        //        guard let chatPartnerId = message.chatPartnerId() else{
        //            return
        //        }
        //        let ref = Database.database().reference().child("Users").child(chatPartnerId)
        //
        //        ref.observeSingleEvent(of: .value, with: { (snapshot) in
        //
        //            guard let dictionary = snapshot.value as? [String:AnyObject] else{
        //                return
        //            }
        //
        //            let user = User()
        //            user.id = chatPartnerId
        //            user.setValuesForKeys(dictionary)
        //            self.showChatControllerForUser(user: user)
        //
        //        }, withCancel: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
           }
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        //itemlist.moveItem(from: fromIndexPath.row, to: to.row)
    }


}
