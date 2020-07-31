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
}
