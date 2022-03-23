//
//  TabBarViewController.swift
//  Contact List
//
//  Created by Тимур on 22.03.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let persons = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendData()
    }
    
    private func sendData() {
        let persons = persons
        
        guard let tabbar = viewControllers else { return }
        
        for viewController in tabbar {
            
            guard let navigationVC = viewController as? UINavigationController else { return }
            if let contactTableVC = navigationVC.topViewController as? ContactTableViewController {
                contactTableVC.persons = persons
            } else if let sectionContactsTVC = navigationVC.topViewController as? SectionContactsTableViewController {
                sectionContactsTVC.persons = persons
            }
        }
    }
}
