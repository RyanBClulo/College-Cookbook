//
//  MasterViewController.swift
//  SplitViewExample
//
//  Created by Ryan Clulo on 3/23/17.
//  Copyright © 2017 Ryan Clulo. All rights reserved.
//

import UIKit

var recipeTable = [recipeObject]()

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    let entry1 = recipeObject(titleInput: ["Boil Water"], ingrediantsInput: ["Water", "Cooking Pot"], stepsInput: ["Place pot filled with water on stove.", "Turn stove on.", "Wait."])
    let entry2 = recipeObject(titleInput: ["Grilled Cheese Sandwich"], ingrediantsInput: ["Two slices of bread", "Cheese (Any flavor)", "Butter"],
                              stepsInput:["Evenly butter one side of each slice of bread.", "Lay one piece of bread in a frying pan on a medium heat stove.",
                                          "Place slices of cheese on the slice of bread. Then, place the second slice of bread on top of the cheese with the buttered side facing up.",
                                          "Cook on stove until both sides are golden brown.", "Enjoy."])
    let entry3 = recipeObject(titleInput: ["Mac and Cheese"], ingrediantsInput: [], stepsInput: [])
    let entry4 = recipeObject(titleInput: ["Tacos"], ingrediantsInput: [], stepsInput: []);
    let entry5 = recipeObject(titleInput: ["Pan-fried Chicken"], ingrediantsInput: [], stepsInput: [])
    let entry6 = recipeObject(titleInput: ["Chicken Alfredo"], ingrediantsInput: [], stepsInput: [])
    let entry7 = recipeObject(titleInput: ["Chocolate Chip Cookies"], ingrediantsInput: [], stepsInput: [])
    let entry8 = recipeObject(titleInput: ["Scrambled Eggs with Vegetables"], ingrediantsInput: [], stepsInput: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        recipeTable.insert(entry1, at: 0)
        recipeTable.insert(entry2, at: 1)
        recipeTable.insert(entry3, at: 2)
        recipeTable.insert(entry4, at: 3)
        recipeTable.insert(entry5, at: 4)
        recipeTable.insert(entry6, at: 5)
        recipeTable.insert(entry7, at: 6)
        recipeTable.insert(entry8, at: 7)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        recipeTable.insert(recipeObject(titleInput: ["Sample Title"], ingrediantsInput: ["Ingrediant 1", "Ingrediant 2"], stepsInput: ["Step 1", "Step 2"]), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = recipeTable[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                //print(controller.detailItem as Any)
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeTable.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = recipeTable[indexPath.row]
        //cell.textLabel?.text = (object.title?.description)!
        cell.textLabel?.text = (object.title?.description)!.description as String
        //print((cell.textLabel?.text)! as String)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipeTable.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

