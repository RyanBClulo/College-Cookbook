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
    @IBOutlet weak var msgeLabel: UILabel!
    @IBOutlet weak var nextOutlet: UIButton!
    @IBOutlet weak var prevOutlet: UIButton!
    
    
    var stepsPlace = 0
    
    @IBAction func nextStep(_ sender: Any) {
        stepsPlace += 1
        if (stepsPlace > (stepsItem?.steps?.count)! - 1){
                msgeLabel.text = "There are no more steps!"
                nextOutlet.isHidden = true
                prevOutlet.isHidden = false
            }
        else {
                nextOutlet.isHidden = false
                prevOutlet.isHidden = false
                msgeLabel.text = ""
                stepsLabel.text = stepsItem?.steps?[stepsPlace]
                print(stepsPlace)
            }
        }
    
    @IBAction func prevStep(_ sender: Any) {
        stepsPlace -= 1
        if(0 < stepsPlace)
        {
            prevOutlet.isHidden = false
            nextOutlet.isHidden = false
            msgeLabel.text = ""
            stepsLabel.text = stepsItem?.steps?[stepsPlace]
            print(stepsPlace)
        }
        else {
            msgeLabel.text = "You are at the first step!"
            prevOutlet.isHidden = true
            nextOutlet.isHidden = false
        }
    }
    
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
                label.text = detail.steps?[stepsPlace]
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
