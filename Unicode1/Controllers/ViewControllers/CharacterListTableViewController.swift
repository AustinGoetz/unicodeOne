//
//  CharacterListTableViewController.swift
//  Unicode1
//
//  Created by Austin Goetz on 7/31/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import UIKit
import CoreData

class CharacterListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func addCharacterButtonTapped(_ sender: Any) {
        presentAlertController()
    }
    

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CharacterController.shared.fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)

        // Configure the cell...

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let characterToDelete = CharacterController.shared.fetchedResultsController.object(at: indexPath)
            CharacterController.shared.delete(characterToDelete)
        }
    }
    
    // MARK: - Helpers
    func presentAlertController() {
        // Create alert controller
        let alertController = UIAlertController(title: "New Character", message: "Input from 1-8 hexadecimal digits. \n Emojis start at 1f600!", preferredStyle: .alert)
        
        // Add a text field - no config handler because we don't need to configure text field with anything special
        alertController.addTextField(configurationHandler: nil)
        
        // Define the buttons
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            // Give the save button necessary actions to perform in completion handler
            guard let textField = alertController.textFields?.first,
                let codePoint = textField.text,
                !codePoint.isEmpty else { return }
            
            CharacterController.shared.createCharacter(with: codePoint)
        }
        
        // Add actions to alert controller
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        // Present final alert controller
        present(alertController, animated: true)
    }
}
