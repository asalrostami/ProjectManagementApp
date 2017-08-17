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
    var projectId = Int()
    var projectName = String()
    
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
        //deleteAll()
        // Do any additional setup after loading the view.
        readData(Project.self, predicate: nil) { (results) in
            for each in results
            {
                projects.append(each)
                projectsTableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        projects.removeAll()
        readData(Project.self, predicate: nil) { (results) in
            for each in results
            {
                projects.append(each)
                projectsTableView.reloadData()
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
        return projects.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPro", for: indexPath) as! ProjectsTableViewCell
        
       
        
        cell.proNameLbl.text = projects[indexPath.row].name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        projectId = projects[indexPath.row].id
        projectName = projects[indexPath.row].name
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         projectId = projects[indexPath.row].id
        projectName = projects[indexPath.row].name
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit Project Name", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.projects[indexPath.row].name
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                
                let selectedProject = self.projects[indexPath.row]
                let newProjectName = alert.textFields!.first!.text!
                
                let realm = try! Realm()
                try! realm.write {
                    selectedProject.name = newProjectName
                }
                self.projectsTableView.reloadRows(at: [indexPath], with: .fade)
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            let oneProject = self.projects[indexPath.row]
            let oneprojectId = self.projects[indexPath.row].id
            let predicate = "id = \(oneprojectId)"
            readData(Task.self, predicate: predicate) { (results) in
                for each in results
                {
                    deleteRealm(each)
                }
            }
            self.projects.remove(at: indexPath.row)
            deleteRealm(oneProject)
            self.projectsTableView.reloadData()
        })
        
        return [deleteAction, editAction]
        

    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "proToNewTask" {
            let vc = segue.destination as! UITabBarController
            let dvc = vc.viewControllers![0] as! NewTaskViewController
            dvc.projectId = self.projectId
            dvc.projectName =  self.projectName + "'s Tasks"
            
            
            let vc2 = segue.destination as! UITabBarController
            let dvc2 = vc2.viewControllers![1] as! NotesViewController
            dvc2.projectIdNote = self.projectId
            dvc2.projectNameNote =  self.projectName + "'s Notes"
            
            }
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
                        self.projectsTableView.reloadData()
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


