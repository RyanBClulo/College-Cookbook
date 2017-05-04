//
//  DetailViewController.swift
//  SplitViewExample
//
//  Created by Ryan Clulo on 3/23/17.
//  Copyright © 2017 Ryan Clulo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingrediantsList: UITextView!
    
    var name: String = ""

    @IBAction func nextButton(_ sender: Any) {
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.recipeTitle {
                label.text = detail.title!.description
                name = detail.title!.description
                print(name)
            }
            if let label = self.ingrediantsList{
                label.text = detail.ingrediants!.description
            }
        }
        
        if (name == "[\"Boil Water\"]"){
            recipeImage.image = #imageLiteral(resourceName: "water")
        }
        else if(name == "[\"Grilled Cheese Sandwich\"]"){
            recipeImage.image = #imageLiteral(resourceName: "grilledcheese")
        }
        else if(name == "[\"Mac and Cheese\"]"){
            recipeImage.image = #imageLiteral(resourceName: "mac")
        }
        else if(name == "[\"Tacos\"]"){
            recipeImage.image = #imageLiteral(resourceName: "tacos")
        }
        else if(name == "[\"Pan-fried Chicken\"]"){
            recipeImage.image = #imageLiteral(resourceName: "chicken")
        }
        else if(name == "[\"Chicken Alfredo\"]"){
            recipeImage.image = #imageLiteral(resourceName: "alfredo")
        }
        else if(name == "[\"Chocolate Chip Cookies\"]"){
            recipeImage.image = #imageLiteral(resourceName: "cookies")
        }
        else if(name == "[\"Scrambled Eggs with Vegetables\"]"){
            recipeImage.image = #imageLiteral(resourceName: "eggs")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSteps" {
                let object = detailItem
                let controller = (segue.destination) as! StepsViewController
                controller.stepsItem = object
                //print(controller.detailItem as Any)
                //print(controller.stepsItem?.title! as Any)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       	 
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: recipeObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

