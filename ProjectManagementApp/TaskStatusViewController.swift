//
//  TaskStatusViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit
import RealmSwift

class TaskStatusViewController: UIViewController {
    
    var selectedTaskStatus = Task()
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var taskNameTxt: UITextView!
    
    
    @IBOutlet weak var startDateTaskLbl: UILabel!
    
    @IBOutlet weak var taskStatusLbl: UILabel!
    
    @IBAction func changeStatusBtn(_ sender: UIButton) {
        var status = selectedTaskStatus.status
        var finishDate = selectedTaskStatus.finishDate
        switch status {
        case 0:
            status = 1
            taskStatusLbl.text = statusNumToString(statusNum: status)
        
        case 1:
            status = 2
            taskStatusLbl.text = statusNumToString(statusNum: status)
            finishDateTaskLbl.text = ConverDateToString()
            finishDate = ConverDateToString()
            changeStatusBtn.isEnabled = false
            changeStatusBtn.setTitleColor(.red, for: .normal)
        case 2:
            taskStatusLbl.text = statusNumToString(statusNum: status)
            changeStatusBtn.isEnabled = false
            changeStatusBtn.setTitleColor(.red, for: .normal)
            
        default:
            status = 0
        }
        

        let realm = try! Realm()
        
        try! realm.write {
            selectedTaskStatus.status = status
            selectedTaskStatus.finishDate = finishDate
            
        }
        
    }
    
    
    @IBOutlet weak var changeStatusBtn: UIButton!
    @IBOutlet weak var finishLbl: UILabel!
    @IBOutlet weak var finishDateTaskLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBtn.isEnabled = true
        taskNameTxt.text = selectedTaskStatus.taskName
        startDateTaskLbl.text = selectedTaskStatus.startDate
        taskStatusLbl.text = statusNumToString(statusNum: selectedTaskStatus.status)
        if (selectedTaskStatus.finishDate != "")
        {
           changeStatusBtn.isEnabled = false
            changeStatusBtn.setTitleColor(.red, for: .normal)
            finishDateTaskLbl.text = selectedTaskStatus.finishDate

        }
        else
        {
             changeStatusBtn.isEnabled = true
            finishDateTaskLbl.text = "task is not Done!"

        }
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
