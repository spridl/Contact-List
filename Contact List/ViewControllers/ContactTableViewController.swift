//
//  ContactTableViewController.swift
//  Contact List
//
//  Created by Тимур on 21.03.2022.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    var dataManager: DataManager!

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.name.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = Person.getPerson(for: indexPath.row, in: dataManager)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = person.fullName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailVC.person = Person.getPerson(for: indexPath.row, in: dataManager)
    }
    
}
