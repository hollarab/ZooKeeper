//
//  Staff+CoreDataProperties.swift
//  ZooKeeper
//
//  Created by hollarab on 3/15/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Staff {

    @NSManaged var birthday: NSTimeInterval
    @NSManaged var isMale: Bool
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var icon: EntityIcon?

}
