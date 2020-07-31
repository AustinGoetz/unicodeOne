//
//  CharacterController.swift
//  Unicode1
//
//  Created by Austin Goetz on 7/31/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

class CharacterController {
    
    // MARK: - Singleton
    static let shared = CharacterController()
    
    // MARK: - Class Properties
    let fetchedResultsController: NSFetchedResultsController<Character>
    
    init() {
        // Step 2: Define the request to pass in to Step 1
        let request: NSFetchRequest<Character> = NSFetchRequest(entityName: "Character")
        
        // Step 3: Add your sort descriptor
        let isEncodedDescriptor = NSSortDescriptor(key: "isEncoded", ascending: true)
        
        request.sortDescriptors = [isEncodedDescriptor]
        
        // Step 1: Set our property to an instance of the controller
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isEncoded", cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    // MARK: - CRUD
    // Create
    func createCharacter(with codePoint: String) {
        _ = Character(codePoint: codePoint)
        
        saveContext()
    }
    
    // Update
    func toggleIsEncoded(for character: Character) {
        character.isEncoded.toggle()
        
        saveContext()
    }
    
    // Delete
    func delete(_ character: Character) {
        CoreDataStack.context.delete(character)
        
        saveContext()
    }
    
    // MARK: - Persistence
    func saveContext() {
        let context = CoreDataStack.context
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
}
