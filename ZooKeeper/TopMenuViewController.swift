//
//  TopMenuViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/16/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit

class TopMenuViewController: UIViewController {

    @IBOutlet weak var zooListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zooListTapped(sender: AnyObject) {
        performSegueWithIdentifier("ZooList", sender: self)
    }

    @IBAction func imageGalleryTapped(sender: AnyObject) {
        let viewController = ImageGalleryViewController.instance()
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
