//
//  SectionContactsTableViewController.swift
//  Contact List
//
//  Created by Тимур on 22.03.2022.
//

import UIKit

class SectionContactsTableViewController: UITableViewController {
    
    var dataManager: DataManager!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.name.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = Person.getPerson(for: indexPath.section, in: dataManager)
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            
            content.text = person.phoneNumber
            content.image = UIImage(systemName: "phone")
            cell.contentConfiguration = content
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            
            content.text = person.email
            content.image = UIImage(systemName: "tray")
            cell.contentConfiguration = content
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = Person.getPerson(for: section, in: dataManager)
        return person.fullName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
