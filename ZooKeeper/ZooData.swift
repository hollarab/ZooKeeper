//
//  ZooData.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class ZooData {
    public static let sharedInstance = ZooData()
    
    private let dataFileName = "zoo"
    
    public var coreDataStack:CoreDataStack
    
    private init() {
        guard let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
            else { fatalError("App Delegate not reachable")}

        coreDataStack = delegate.coreDataStack
        
//        ZooFactory.insertAnimalsIntoContext(coreDataStack.mainContext, fromFilename: dataFileName)
//        coreDataStack.saveContext(coreDataStack.mainContext)
        
        let animalFetch = NSFetchRequest(entityName: "Animal")
        
        do {
            let fetchedAnimals = try coreDataStack.mainContext.executeFetchRequest(animalFetch) as! [Animal]
            for animal in fetchedAnimals {
                print("Got \(animal.name)")
            }
        } catch {
            fatalError("Failed to fetch: \(error)")
        }
    }
    
    
    func coreDataSaveMain() {
        do {
            try coreDataStack.mainContext.save()
        } catch let e {
            print(e)
        }
    }
}

