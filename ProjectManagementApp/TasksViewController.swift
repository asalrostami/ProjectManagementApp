//
//  TasksViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-07.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit
import RealmSwift

class TasksViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource,UITextFieldDelegate{
   
    var tasks = [Task]()
    var selectedTask = Task()
    
    @IBOutlet weak var searchTaskTxt: UITextField!

    @IBOutlet weak var taskTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource  = self
        searchTaskTxt.delegate = self
        
        readData(Task.self, predicate: nil) { (results) in
            for each in results
            {
                tasks.append(each)
                taskTableView.reloadData()
            }
        }


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tasks.removeAll()
        readData(Task.self, predicate: nil) { (results) in
            for each in results
            {
                tasks.append(each)
                taskTableView.reloadData()
            }
        }
        

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
    
        cell.taskLbl.text = tasks[indexPath.row].taskName
        cell.startDateOfTaskCell.text = tasks[indexPath.row].startDate
        cell.statusTaskCell.text = statusNumToString(statusNum: tasks[indexPath.row].status)
        cell.finishDateCell.text = tasks[indexPath.row].finishDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit Task Name", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.tasks[indexPath.row].taskName
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                
                let selectedTask = self.tasks[indexPath.row]
                let newTaskName = alert.textFields!.first!.text!
                
                let realm = try! Realm()
                try! realm.write {
                    selectedTask.taskName = newTaskName
                }
                self.taskTableView.reloadRows(at: [indexPath], with: .fade)
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            
            let oneTask = self.tasks[indexPath.row]
            self.tasks.remove(at: indexPath.row)
            deleteRealm(oneTask)
            self.taskTableView.reloadData()
        })
        
        return [deleteAction, editAction]
        
        
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         selectedTask = tasks[indexPath.row]
        
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        selectedTask = tasks[indexPath.row]
        return indexPath
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "tasksToStatus"
                {
                    let vc = segue.destination as! TaskStatusViewController
    
                    vc.selectedTaskStatus = selectedTask
        
                   
                }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.tasks.removeAll()
        //print(projects.count)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if (textField.text?.characters.count)! > 0
            {
                //search in realm
                let realm = try! Realm()
                let predicate = NSPredicate(format: "taskName CONTAINS [c] %@", textField.text!)
                let filter_project = realm.objects(Task).filter(predicate)
                for each in filter_project
                {
                    self.tasks.append(each)
                    self.taskTableView.reloadData()
                }
                
            } else
            {
                readData(Task.self, predicate: nil, completion: { (results) in
                    for each in results
                    {
                        self.tasks.append(each)
                        self.taskTableView.reloadData()
                    }
                })
            }
            print(self.tasks.count)
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
