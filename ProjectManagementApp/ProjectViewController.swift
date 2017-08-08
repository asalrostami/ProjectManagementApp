//
//  ProjectViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-02.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {
    var name: String!

    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var startDateTxtField: UITextField!
    
    
    
    @IBOutlet weak var finishDateTxtField: UITextField!
    
    
    @IBAction func addButton(_ sender: UIButton) {
     self.dismiss(animated: true, completion: nil)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = name

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
