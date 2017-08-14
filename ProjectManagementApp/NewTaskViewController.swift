//
//  NewTaskViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-08.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var newTaskTxt: UITextView!
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
    }

    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var startDateTaskLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeStatus(_ sender: UIButton) {
    }
    var projectName = ["asalPro" , "siamakPro" , "JuliePro" , "aPro","bPro","cpro"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNewTask", for: indexPath) as! NewTaskTableViewCell
        
        let proName = projectName[indexPath.row]
        
        cell.taskLBL.text = proName
        
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
        if editingStyle == UITableViewCellEditingStyle.delete { //The user click on the delete button
            
            // Identify the item to delete
            let project = projectName[indexPath.row]
            
            
            let title = "Delete \(project)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                // self.itemlist.removeItem(item)
                                                
                                                // Also remove that row from the table view with an animation
                                               // self.projectsTableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        } /*else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }   */
    }
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        //itemlist.moveItem(from: fromIndexPath.row, to: to.row)
    }

}
