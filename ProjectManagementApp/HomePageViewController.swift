//
//  HomePageViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-02.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var MainBackImage: UIImageView!
    

    @IBOutlet weak var projectsTableView: UITableView!
    
    //var project = project()
    
    let projectName = ["asalPro" , "siamakPro" , "JuliePro" , "aPro","bPro","cpro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectsTableView.delegate = self
        projectsTableView.dataSource = self

        
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
        return projectName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPro", for: indexPath) as! ProjectsTableViewCell
        
        let proName = projectName[indexPath.row]
        
        cell.proNameLbl.text = proName
        
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
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "homeToProject"
//        {
//            
//            if let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first {
//                
//                let vc = segue.destination as! ProjectViewController
//                print("selected = \(selectedIndexPath.row)")
//                print("selected = \(selectedIndexPath.item)")
//                
//                
//                vc.name = projectName[selectedIndexPath.item]
//                
//            }
//        }
    }

    func showAlert(text:String)  {
        let alert = UIAlertController(title: "Attention", message: text, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    

}


