//
//  AnimalImagesViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/16/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private static let storyboard = UIStoryboard(name: "Modals", bundle: nil)

    static func instance() -> ImageGalleryViewController {
        return storyboard.instantiateViewControllerWithIdentifier("ImageGalleryViewController") as! ImageGalleryViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.registerNib(UINib(nibName: "StaffCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StaffCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissTouched(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnimalCell", forIndexPath: indexPath) as! AnimalCollectionViewCell
            cell.nameLabel.text = "name"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StaffCell", forIndexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CollectionHeader", forIndexPath: indexPath) as! GalleryHeader
        header.nameLabel.text = indexPath.section == 0 ? "Animals" : "Staff"
        return header
    }
    
}
