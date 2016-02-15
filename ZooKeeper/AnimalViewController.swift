//
//  AnimalViewController.swift
//  ZooKeeper
//
//  Created by hollarab on 2/9/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit

class AnimalViewController: DetailViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func configureView() {
        if let animal = self.detailItem as? Animal where nameTextField != nil {
            nameTextField?.text = animal.name
            colorTextField?.text = animal.color
            if let weight = animal.currentWeight {
                weightTextField?.text = NSString(format: "%0.2", weight) as String
            } else {
                weightTextField?.text = "unknown"
            }
            genderSegmentedControl?.selectedSegmentIndex = animal.isMale ? 0 : 1
            photoImageView.image = animal.photo ?? UIImage(named: "camera")
        }
    }

    
    @IBAction func itemChanged(sender:AnyObject) {
        guard let animal = detailItem as? Animal else {return}
        
        animal.name = nameTextField.text!
        animal.color = colorTextField.text!
        animal.currentWeight = Float(weightTextField.text!)
        animal.isMale = genderSegmentedControl.selectedSegmentIndex == 0 ? true : false
        animal.birthday = birthdayDatePicker.date
    }
    
    
    @IBAction func photoButtonTouched(sender: AnyObject) {
        ABHPresentImageCapture(self)
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
    
        picker.dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let animal = detailItem as? Animal {
                photoImageView.image = image
                animal.photo = image
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

