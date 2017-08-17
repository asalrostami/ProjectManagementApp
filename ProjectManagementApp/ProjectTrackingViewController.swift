//
//  ProjectTrackingViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class ProjectTrackingViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    var projectId = Int()
    var projectName = String()
    var projectStartDate = String()
    var projectFinishDate = String()
    var tasks = [Task]()
    var count:Int = 0
    
    
    @IBOutlet weak var naviItem: UINavigationItem!
    
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
        
        //fetch tasks of this project into the table view
        let predicate = "id = \(projectId)"
        readData(Task.self, predicate: predicate) { (results) in
            for each in results
            {
                tasks.append(each)
                tasksTableView.reloadData()
            }
        }
        naviItem.title = projectName
        
        projectStartDateLbl.text = projectStartDate
        projectFinishDateLbl.text = projectFinishDate
        numOfToDoTaskLbl.text = String(calculateCountOfTask(model: tasks, status: 0))
        numOfInProgressLbl.text = String(calculateCountOfTask(model: tasks, status: 1))
        numOfDoneTaskLbl.text = String(calculateCountOfTask(model: tasks, status: 2))
        
        
       


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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTaskDashboard", for: indexPath) as! ProjectTrackingTableViewCell
        
        
        cell.taskNameLblCell.text = tasks[indexPath.row].taskName
        cell.startDateTaskCell.text = tasks[indexPath.row].startDate
        cell.statusTaskCell.text = statusNumToString(statusNum: tasks[indexPath.row].status)
        cell.finishDateTaskCell.text = tasks[indexPath.row].finishDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oneTask = tasks[indexPath.row]
        if (oneTask.status == 2)
        {
            let startDate_DateFormat = ConverStringToDate(dateString: tasks[indexPath.row].startDate)
            let finishDate_DateFormat = ConverStringToDate(dateString: tasks[indexPath.row].finishDate)
            let durationTask = daysBetweenDates(firstDate: startDate_DateFormat, secondDate: finishDate_DateFormat)
            
            
            durationOfTaskLbl.text = String(durationTask) + "  days"
        }
        else
        {
            durationOfTaskLbl.text = " Task is not Done yet"

        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
           }
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        //itemlist.moveItem(from: fromIndexPath.row, to: to.row)
    }
    /// ### calculate number of status of tasks
    func calculateCountOfTask(model:[Task],status:Int) -> Int
    {
        count = 0
        for each in model
        {
            if (each.status == status)
            {
                count += 1
            }
        }
        
        
        
        return count
        
    }



}
