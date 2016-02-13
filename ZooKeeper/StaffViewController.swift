//
//  StaffViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/13/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit

class StaffViewController: DetailViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func configureView() {
        if let staff = self.detailItem as? Staff where nameLabel != nil {
            nameLabel?.text = staff.name
        }
    }

}
