//
//  AnimalImagesViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/16/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit
import Firebase

struct AnimalImage {
    var key:String
    var imageString:String
}

class ImageGalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private static let storyboard = UIStoryboard(name: "Modals", bundle: nil)

    var animalImages = [AnimalImage]()
    
    static func instance() -> ImageGalleryViewController {
        return storyboard.instantiateViewControllerWithIdentifier("ImageGalleryViewController") as! ImageGalleryViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.registerNib(UINib(nibName: "StaffCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StaffCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let rootRef = ZooData.sharedInstance.rootRef
        let animalImagesRef = rootRef.childByAppendingPath("images/animals")
        animalImagesRef.observeEventType(.Value, withBlock: { (snapshot: FDataSnapshot!) in
            self.animalImages.removeAll()
            for item in snapshot.children  {
                guard let item = item as? FDataSnapshot,
                      let value = item.value as? String else {continue}
                self.animalImages.append(AnimalImage(key: item.key, imageString: value))
            }
            self.imageCollectionView.reloadData()
        })
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
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalImages.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnimalCell", forIndexPath: indexPath) as! AnimalCollectionViewCell

            let animalImage = animalImages[indexPath.row]
            cell.nameLabel.text = animalImage.key
            if let data = NSData(base64EncodedString: animalImage.imageString, options: .IgnoreUnknownCharacters),
                let image = UIImage(data: data) {
                    cell.animalImageView.image = image
            }
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
