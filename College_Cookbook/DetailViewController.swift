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
                label.text = detail.description
            }
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

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}
