//
//  HomePageViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-02.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    
    var project = Project()
    
    @IBOutlet weak var MainBackImage: UIImageView!
    
    @IBAction func test(_ sender: Any) {
        if isEditing {
            // Change text of button to inform user of state
            (sender as! UIButton).setTitle("Edit", for: UIControlState.normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            (sender as! UIButton).setTitle("Done", for: UIControlState.normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }

    }

    @IBOutlet weak var projectsTableView: UITableView!
    
 
    
    
    @IBAction func addNewProject(_ sender: UIBarButtonItem) {
        
        let alert: UIAlertController =
            UIAlertController(title: "Add New Project", message: "Please Enter the Required Information", preferredStyle:  UIAlertControllerStyle.alert)
        
        
         //set the color of the Alert
        let subView = alert.view.subviews.first!
        let alertContentView = subView.subviews.first!
        alertContentView.backgroundColor = UIColor.purple
        alertContentView.layer.cornerRadius = 5
        
        
        
        alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
            text.placeholder = "Enter project Name"
            text.borderStyle = .roundedRect
        })
        alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
            text.placeholder = "Enter Start Date"
            text.borderStyle = .roundedRect
        })
        alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
            text.placeholder = "Enter finish Date"
            text.borderStyle = .roundedRect
        })
        
        //Define a default (OK) alert action with a specific method (handler) to execute if the OK button is clicked
        let defaultAction: UIAlertAction =
            UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                
           //save to database
  
                let projectName = alert.textFields![0] as UITextField
                let projectStartDate = alert.textFields![1] as UITextField
                let projectFinishDate = alert.textFields![2] as UITextField
                
               if projectName.text != "" && projectStartDate.text != "" && projectFinishDate.text != "" {
                self.project.name = projectName.text!
                
               } else {
                
                //popup a alert when the textFields are empty
                let errorAlert = UIAlertController(title: "Error", message: "Please input the required information", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                    (action: UIAlertAction!) -> Void in
                    
                    self.present(alert, animated: true, completion: nil)
                }))
                self.present(errorAlert, animated: true, completion: nil)                }
//                //Set the date of the manager object to be the current date
//                manager.date = NSDate()
//                
            })
        //Define a cancel alert action with no method (handler) to execute if the cancel button is clicked
        let cancelAction: UIAlertAction =
            UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:{
                (action: UIAlertAction!) -> Void in
            })
        //Associate the cancel action to the alert
        alert.addAction(cancelAction)
        //Associate the default (OK) action to the alert
        alert.addAction(defaultAction)
        //Show the alert to the user
        present(alert, animated: true, completion: nil)
     }
    

    
    
    
    var projectName = ["asalPro" , "siamakPro" , "JuliePro" , "aPro","bPro","cpro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectsTableView.delegate = self
        projectsTableView.dataSource = self

        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPro", for: indexPath) as! ProjectsTableViewCell
        
        let proName = projectName[indexPath.row]
        
        cell.proNameLbl.text = proName
        
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
                                                self.projectsTableView.deleteRows(at: [indexPath], with: .automatic)
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
    

}


