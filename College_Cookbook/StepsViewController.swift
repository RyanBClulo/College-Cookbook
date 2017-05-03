//
//  StepsViewController.swift
//  College_Cookbook
//
//  Created by Jason Wallenfang on 5/3/17.
//  Copyright © 2017 CollegeCB_Team. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {
    
    @IBOutlet weak var stepsTitle: UILabel!
    @IBOutlet weak var stepsImage: UIImageView!
    @IBOutlet weak var stepsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //stepsTitle.text = recipeTable.first!.title!.description
        
        //recipeTitle.text = recipeTable.first?.title!.description
        // Do any additional setup after loading the view.
        self.configureView()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.stepsItem {
            if let label = self.stepsTitle {
                label.text = detail.title!.description
            }
            if let label = self.stepsLabel{
                label.text = detail.steps!.description
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var stepsItem: recipeObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
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
