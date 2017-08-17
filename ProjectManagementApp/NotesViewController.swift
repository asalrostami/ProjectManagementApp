//
//  NotesViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-13.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    var notes = [Note]()
    var projectIdNote = Int()
    var projectNameNote = String()
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        
        if noteTxt.text != ""
        {
            
            let note = Note()
            note.id = projectIdNote
            note.noteId = createId(Note.self , id: "noteId")
            note.noteDesc = noteTxt.text!
            note.noteDate = ConverDateToString()

            saveData(note, isUpdate: true)
            notes.append(note)
            DispatchQueue.main.async {
                self.notesTableView.reloadData()
            }
            print(" note  added in the realm successfully by id\(note.id)")
            print(" note  added in the realm successfully by taskid\(note.noteId)")
        }
        else
        {
            showAlert(text: "Please enter Note Description!")
        }
    }
    
    @IBOutlet weak var noteTxt: UITextView!
    
    
    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        naviItem.title = projectNameNote
        
        //fetch tasks of this project into the table view
        let predicate = "id = \(projectIdNote)"
        readData(Note.self, predicate: predicate) { (results) in
            for each in results
            {
                notes.append(each)
                notesTableView.reloadData()
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
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellnotes", for: indexPath) as! NotesTableViewCell
        
    
        cell.descLbl.text = notes[indexPath.row].noteDesc
        cell.dateNoteLblCell.text = notes[indexPath.row].noteDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let message = messages[indexPath.row]
        //
        //        guard let chatPartnerId = message.chatPartnerId() else{
        //            return
        //        }
        //        let ref = Database.database().reference().child("Users").child(chatPartnerId)
        //
        //        ref.observeSingleEvent(of: .value, with: { (snapshot) in
        //
        //            guard let dictionary = snapshot.value as? [String:AnyObject] else{
        //                return
        //            }
        //
        //            let user = User()
        //            user.id = chatPartnerId
        //            user.setValuesForKeys(dictionary)
        //            self.showChatControllerForUser(user: user)
        //
        //        }, withCancel: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete { //The user click on the delete button
            
            // Identify the item to delete
            let oneNote = notes[indexPath.row]
            let oneNoteDesc = notes[indexPath.row].noteDesc
            
            
            let title = "Delete \(oneNoteDesc)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.notes.remove(at: indexPath.row)
                                                
                                                deleteRealm(oneNote)
                                                print("deleted successfully\(oneNoteDesc)")
                                                
                                                // Also remove that row from the table view with an animation
                                                self.notesTableView.deleteRows(at: [indexPath], with: .left)

            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
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
