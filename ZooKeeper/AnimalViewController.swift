//
//  AnimalViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/9/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit
import Firebase

class AnimalViewController: DetailViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet var photoImageView: UIImageView!
    
    var animalKey:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let key = animalKey where detailItem == nil {
            let ref = ZooData.sharedInstance.rootRef.childByAppendingPath("animals/\(key)")
            ref.observeEventType(.Value, withBlock: { (snapshot) -> Void in
                self.detailItem = Animal(snapshot: snapshot)
                self.configureView()
            })
        }
    }
    
    override func configureView() {
        guard let animal = self.detailItem as? Animal where nameTextField != nil else {return}
        
        nameTextField?.text = animal.name
        colorTextField?.text = animal.color
        if let weight = animal.currentWeight {
            let str = weight.format("0.2")
            weightTextField?.text = str
        } else {
            weightTextField?.text = "unknown"
        }
        if let bday = animal.birthday {
            birthdayDatePicker.date = bday
        }
        genderSegmentedControl?.selectedSegmentIndex = animal.isMale ? 0 : 1
        photoImageView.image = animal.hasCustomImage() ? animal.getImage() : UIImage(named: "camera")
    }

    
    @IBAction func itemChanged(sender:AnyObject) {
        guard let animal = detailItem as? Animal else {return}
        
        animal.name = nameTextField.text!
        animal.color = colorTextField.text!
        animal.currentWeight = Float(weightTextField.text!)
        animal.isMale = genderSegmentedControl.selectedSegmentIndex == 0 ? true : false
        animal.birthday = birthdayDatePicker.date
        animal.updateInFB()
    }
    
    
    @IBAction func photoButtonTouched(sender: AnyObject) {
        guard let animal = detailItem as? Animal else { return }
        
        if !animal.hasCustomImage() {
            ABHPresentImageCapture(self)
        } else {
            ABHAlertFor(self, title: "Replace photo", message: "Are you sure you want to replace this image?", okCallback: { () -> Void in
                ABHPresentImageCapture(self)
                }, cancelCallback: nil)
        }
    }
}

extension AnimalViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        itemChanged(textField)
        return true
    }
}


extension AnimalViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController,
         didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let animal = detailItem as? Animal {
                photoImageView.image = image
                animal.saveImage(image)
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

