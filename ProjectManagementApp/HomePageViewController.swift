//
//  HomePageViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-02.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit
import RealmSwift

class HomePageViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UITextFieldDelegate{

    
    var projects = [Project]()
    
    @IBOutlet weak var MainBackImage: UIImageView!
    
   
    @IBOutlet weak var searchTxt: UITextField!
    
    @IBOutlet weak var projectsTableView: UITableView!
    

    @IBAction func addNewProject(_ sender: UIBarButtonItem) {
          }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectsTableView.delegate = self
        projectsTableView.dataSource = self
        searchTxt.delegate = self
        
        
        deleteAll()
        
        readData(Project.self, predicate: nil) { (results) in
            for each in results
            {
                projects.append(each)
            }
        }

        
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
        return projects.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPro", for: indexPath) as! ProjectsTableViewCell
        
       
        
        cell.proNameLbl.text = projects[indexPath.row].name
        
        
        return cell
    }
    
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete { //The user click on the delete button
            
            // Identify the item to delete
            let project = projects[indexPath.row]
            
            
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        self.projects.removeAll()
        //print(projects.count)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if (textField.text?.characters.count)! > 0
            {
                //search in realm
                let realm = try! Realm()
                let predicate = NSPredicate(format: "name CONTAINS [c] %@", textField.text!)
                let filter_project = realm.objects(Project).filter(predicate)
                for each in filter_project
                {
                    self.projects.append(each)
                    self.projectsTableView.reloadData()
                }
                
            } else
            {
                readData(Project.self, predicate: nil, completion: { (results) in
                    for each in results
                    {
                        self.projects.append(each)
                    }
                })
            }
            print(self.projects.count)
        }
        return true
    }
    

    func showAlert(text:String)  {
        let alert = UIAlertController(title: "Attention", message: text, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    

}


