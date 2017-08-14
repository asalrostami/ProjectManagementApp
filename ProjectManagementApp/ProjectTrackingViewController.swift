//
//  ProjectTrackingViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class ProjectTrackingViewController: UIViewController {
    
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
