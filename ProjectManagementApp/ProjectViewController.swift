//
//  ProjectViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-02.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit
import RealmSwift

class ProjectViewController: UIViewController {
    var name: String!

    var projects = [Project]()
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var startDateTxtField: UITextField!
    
    
    
    @IBOutlet weak var finishDateTxtField: UITextField!
    
    

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        if nameTxtField.text != "" && startDateTxtField.text != "" && finishDateTxtField.text != ""
        {
        
           
            let project = Project()
            project.id = createId(Project.self)
            project.name = nameTxtField.text!
            project.startDate = startDateTxtField.text!
            project.finishDate = finishDateTxtField.text!
            
            saveData(project, isUpdate: true)
            print("added in the realm successfully by id\(project.id)")
            
        } else {
            showAlert(text: "please Enter the required Information")
        }
        //Set the date of the manager object to be the current date
       // manager.date = NSDate()
        
        
        
    }
    
    var datePicker : UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    func pickUpDate(_ textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        
        if textField == startDateTxtField
        {
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ProjectViewController.doneClickStart))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ProjectViewController.cancelClickStart))
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            textField.inputAccessoryView = toolBar
        }else if textField == finishDateTxtField
        {
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ProjectViewController.doneClickEnd))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ProjectViewController.cancelClickEnd))
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            textField.inputAccessoryView = toolBar

            
        }
        
    }
    func doneClickStart() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        startDateTxtField.text = dateFormatter1.string(from: datePicker.date)
        startDateTxtField.resignFirstResponder()
    }
    func doneClickEnd() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        finishDateTxtField.text = dateFormatter1.string(from: datePicker.date)
        finishDateTxtField.resignFirstResponder()
    }

    func cancelClickStart() {
        startDateTxtField.resignFirstResponder()
    }
    func cancelClickEnd() {
        finishDateTxtField.resignFirstResponder()
    }
    
    @IBAction func startDate(_ sender: UITextField) {
        pickUpDate(sender)
    }
    
    
    @IBAction func finishDate(_ sender: UITextField) {
        pickUpDate(sender)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
         if textField == self.startDateTxtField
         {
           self.pickUpDate(self.startDateTxtField)
        }
        else if textField == self.finishDateTxtField
         {
             self.pickUpDate(self.finishDateTxtField)
        }
    }

    func showAlert(text:String)  {
        let alert = UIAlertController(title: "Attention", message: text, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}
