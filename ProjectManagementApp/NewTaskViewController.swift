//
//  NewTaskViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-08.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit
import RealmSwift


class NewTaskViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    var projectId = Int()
     var projectName = String()
    var tasks = [Task]()
    
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var navitem: UINavigationItem!
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var newTaskTxt: UITextView!
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        
        if newTaskTxt.text != ""
        {
          
            let task = Task()
            task.id = projectId
            task.taskId = createId(Task.self , id: "taskId")
            task.taskName = newTaskTxt.text!
            task.startDate = startDateTaskLbl.text!
            task.status = statusStringToNum(statusString: statusLbl.text!)
            task.finishDate = ""
            
            saveData(task, isUpdate: true)
            tasks.append(task)
            DispatchQueue.main.async {
                self.taskTableView.reloadData()
            }
            print(" task \(task.taskName) added in the realm successfully by id\(task.id)")
             print(" task \(task.taskName) added in the realm successfully by taskid\(task.taskId)")
           }
        else
        {
            showAlert(text: "Please enter Task Description!")
        }
    }

    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var startDateTaskLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        taskTableView.delegate = self
        taskTableView.dataSource = self
        navitem.title = projectName
        navigationItem.title = projectName
        print(projectName)
        print("\(projectId)")
        startDateTaskLbl.text = ConverDateToString()
        
        //fetch tasks of this project into the table view
        let predicate = "id = \(projectId)"
        readData(Task.self, predicate: predicate) { (results) in
            for each in results
            {
                tasks.append(each)
                taskTableView.reloadData()
            }
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeStatus(_ sender: UIButton) {
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNewTask", for: indexPath) as! NewTaskTableViewCell
    
        
        cell.taskLBL.text = tasks[indexPath.row].taskName
        cell.startDateTaskCellLbl.text = tasks[indexPath.row].startDate
        cell.statusTaskCellLbl.text = statusNumToString(statusNum: tasks[indexPath.row].status)
        
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
            let name = tasks[indexPath.row].taskName
            let onetask = tasks[indexPath.row]
            
            let title = "Delete \(name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.tasks.remove(at: indexPath.row)
                                               
                                                deleteRealm(onetask)
                                                print("deleted successfully\(name)")
                                                
                                                // Also remove that row from the table view with an animation
                                               self.taskTableView.deleteRows(at: [indexPath], with: .left)
                                                
                                                          })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        } /*else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }   */
    }
    func showAlert(text:String)  {
        let alert = UIAlertController(title: "Attention", message: text, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
   

}
