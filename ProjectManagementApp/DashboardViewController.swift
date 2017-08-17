//
//  DashboardViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-07.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit
import RealmSwift

class DashboardViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UITextFieldDelegate{
    
    var projects = [Project]()
    var projectIdDahs = Int()
    var projectNameDash = String()
    var projectStartDateDash = String()
    var projectFinishDateDash = String()
    

    @IBOutlet weak var dashboardTableView: UITableView!
    
    @IBOutlet weak var searchTxt: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        searchTxt.delegate = self
        
        readData(Project.self, predicate: nil) { (results) in
            for each in results
            {
                projects.append(each)
            }
        }


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        projects.removeAll()
        readData(Project.self, predicate: nil) { (results) in
            for each in results
            {
                projects.append(each)
                dashboardTableView.reloadData()
            }
        }    }

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDashboard", for: indexPath) as! DashboardTableViewCell
    
        
        cell.projectNameLblCell.text = projects[indexPath.row].name
        cell.startDateProjectCell.text = projects[indexPath.row].startDate
        
        return cell
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        projectIdDahs = projects[indexPath.row].id
        projectNameDash = projects[indexPath.row].name
        projectStartDateDash = projects[indexPath.row].startDate
        projectFinishDateDash = projects[indexPath.row].finishDate
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        projectIdDahs = projects[indexPath.row].id
        projectNameDash = projects[indexPath.row].name
        projectStartDateDash = projects[indexPath.row].startDate
        projectFinishDateDash = projects[indexPath.row].finishDate
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "dashboardToTracking" {
            let vc = segue.destination as! ProjectTrackingViewController
            vc.projectId = self.projectIdDahs
            vc.projectName =  self.projectNameDash
            vc.projectStartDate = self.projectStartDateDash
            vc.projectFinishDate = self.projectFinishDateDash
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
                    self.dashboardTableView.reloadData()
                }
                
            } else
            {
                readData(Project.self, predicate: nil, completion: { (results) in
                    for each in results
                    {
                        self.projects.append(each)
                        self.dashboardTableView.reloadData()

                    }
                })
            }
            print(self.projects.count)
        }
        return true
    }
    


}
