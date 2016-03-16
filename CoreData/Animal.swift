//
//  Animal.swift
//  ZooKeeper
//
//  Created by hollarab on 3/15/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Animal: NSManagedObject {

    func hasCustomImage() -> Bool {
        return self.icon == nil
    }
    
    func iconOrDefaultImage() -> UIImage? {
        if let data = self.icon?.imageData {
            return UIImage(data: data)
        } else {
            return UIImage(named: type.lowercaseString)
        }
    }
    
    func saveIconImage(image:UIImage) {
        let normalized = image.normalizedImage()
        let imageData = UIImageJPEGRepresentation(normalized, 0.9)
        
        if let icon = self.icon {
            icon.imageData = imageData
        } else {
            let newIcon = NSEntityDescription.insertNewObjectForEntityForName("EntityIcon",
                inManagedObjectContext: self.managedObjectContext!) as! EntityIcon
            self.icon = newIcon
            newIcon.imageData = imageData
        }
    }
}


