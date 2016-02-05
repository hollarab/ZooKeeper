//
//  Animal.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

protocol Quackable {
    func quack()
}

protocol Spawnable {
    func spawn()
}

public class Animal {
    var name:String
    var color:String
    
    init(name:String, color:String) {
        self.name = name
        self.color = color
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func report() {
        print("I'm a \(color) \(name) Aminal")
    }
}

public class Duck : Animal, Quackable {
    
    public init(color:String) {
        super.init(name: "Duck", color:color)
    }
    
    public func quack() {
        print("Quack")
    }
}

public class Fish : Animal, Spawnable {
    
    public init(color:String) {
        super.init(name: "Fish", color:color)
    }
    
    public func spawn() {
        print("long trip ahead...")
    }
}
