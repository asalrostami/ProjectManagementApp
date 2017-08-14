//
//  TaskStatusViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class TaskStatusViewController: UIViewController {
    
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var taskNameTxt: UITextView!
    
    
    @IBOutlet weak var startDateTaskLbl: UILabel!
    
    @IBOutlet weak var taskStatusLbl: UILabel!
    
    @IBAction func changeStatusBtn(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var finishLbl: UILabel!
    @IBOutlet weak var finishDateTaskLbl: UILabel!
    
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
