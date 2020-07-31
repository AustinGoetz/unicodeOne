//
//  CoreDataStack.swift
//  Unicode1
//
//  Created by Austin Goetz on 7/31/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UnicodeCoreData")
        container.loadPersistentStores { (_, error) in
            if let error = error {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
