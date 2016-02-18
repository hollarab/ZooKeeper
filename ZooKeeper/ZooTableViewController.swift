//
//  MasterViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit

let animalSection = 0
let staffSection = 1

class ZooTableViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var zoo:Zoo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        zoo = ZooData.sharedInstance.zoo
        tableView.rowHeight = 85.0
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
//        objects.insert(NSDate(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailItem:AnyObject?

        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController

        if let indexPath = self.tableView.indexPathForSelectedRow {
            if segue.identifier == "animalDetail" {
                detailItem = zoo.animals[indexPath.row]
            } else if segue.identifier == "staffDetail" {
                detailItem = zoo.staff[indexPath.row]
                (controller as! StaffViewController).delegate = self
            }
        }
        
        controller.detailItem = detailItem
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case animalSection:
            return zoo.animals.count
        case staffSection:
            return zoo.staff.count
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("AnimalCell", forIndexPath: indexPath) as! AnimalTableViewCell

            let animal = zoo.animals[indexPath.row]
            cell.configureViewForAnimal(animal)
        return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("StaffCell", forIndexPath: indexPath) as! StaffTableViewCell
            let staff = zoo.staff[indexPath.row]
            cell.configureViewForStaff(staff)
            return cell
        }
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // remove the delete method
}


extension ZooTableViewController: StaffDelegate {
    func test() {

    }
}
