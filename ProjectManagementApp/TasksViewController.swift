//
//  TasksViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-07.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
   
    
    @IBOutlet weak var searchTaskTxt: UITextField!

    @IBOutlet weak var taskTableView: UITableView!
    
     let tasks = ["task1" , "task2" , "task3" , "task4","task5","task6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource  = self

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
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTasks", for: indexPath) as! TasksTableViewCell
        
        let taskName = tasks[indexPath.row]
        
        cell.taskLbl.text = taskName
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "homeToProject"
        //        {
        //
        //            if let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first {
        //
        //                let vc = segue.destination as! ProjectViewController
        //                print("selected = \(selectedIndexPath.row)")
        //                print("selected = \(selectedIndexPath.item)")
        //
        //
        //                vc.name = projectName[selectedIndexPath.item]
        //
        //            }
        //        }
    }
    
    func showAlert(text:String)  {
        let alert = UIAlertController(title: "Attention", message: text, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
//***************for changing bar button done to edit******************
    
    
//    if self.tableView.editing{
//    let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editTable:")
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem
//    self.tableView.setEditing(false, animated: true)
//    }else{
//    let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "editTable:")
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem
//    self.tableView.setEditing(true, animated: true)
//    }

}
