//
//  Animal+CoreDataProperties.swift
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

extension Animal {

    @NSManaged var color: String
    @NSManaged var currentWeight: Float
    @NSManaged var birthday: NSTimeInterval
    @NSManaged var isMale: Bool
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var icon: EntityIcon?

    public func report() -> String {
        return "I'm \(name ?? "") a \(isMale ? "boy" : "girl") \(color ?? "") \(type ?? "") Aminal"
    }

}
