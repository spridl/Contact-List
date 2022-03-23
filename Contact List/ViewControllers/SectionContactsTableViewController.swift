//
//  SectionContactsTableViewController.swift
//  Contact List
//
//  Created by Тимур on 22.03.2022.
//

import UIKit

class SectionContactsTableViewController: UITableViewController {
    
    var persons: [Person]!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return setCell(
                withIdentifier: "phoneCell",
                for: indexPath, withImage: "phone",
                of: persons[indexPath.section].phoneNumber
            )
        } else {
            return setCell(
                withIdentifier: "emailCell",
                for: indexPath,
                withImage: "tray",
                of: persons[indexPath.section].email
            )
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = persons[section].fullName
        return person
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func setCell(withIdentifier identifier: String, for indexPath: IndexPath, withImage imageName: String, of person: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = person
        content.image = UIImage(systemName: imageName)
        cell.contentConfiguration = content
        
        return cell
    }
}
