//
//  HomePageViewController.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-02.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var MainBackImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var project = project()
    
    let projectName = ["asalPro" , "siamakPro" , "JuliePro" , "aPro","bPro","cpro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

               
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToProject"
        {
            
            if let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first {
                
                let vc = segue.destination as! ProjectViewController
                print("selected = \(selectedIndexPath.row)")
                print("selected = \(selectedIndexPath.item)")
                
                
                vc.name = projectName[selectedIndexPath.item]
                
            }
        }
    }


    

}


