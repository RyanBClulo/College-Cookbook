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

    @IBAction func nextButton(_ sender: Any) {
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.recipeTitle {
                label.text = detail.title!.description
            }
            if let label = self.ingrediantsList{
                label.text = detail.ingrediants!.description
            }
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

