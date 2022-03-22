//
//  TabBarViewController.swift
//  Contact List
//
//  Created by Тимур on 22.03.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendData()
    }
    
    private func sendData() {
        let shuffledData = shuffleDataManager()
        
        guard let tabbar = viewControllers else { return }
        
        for viewController in tabbar {
            
            guard let navigationVC = viewController as? UINavigationController else { return }
            if let contactTableVC = navigationVC.topViewController as? ContactTableViewController {
                contactTableVC.dataManager = shuffledData
            } else if let sectionContactsTVC = navigationVC.topViewController as? SectionContactsTableViewController {
                sectionContactsTVC.dataManager = shuffledData
            }
        }
    }
    
    private func shuffleDataManager() -> DataManager {
        let dataManager = DataManager()
        
        dataManager.email.shuffle()
        dataManager.name.shuffle()
        dataManager.phoneNumber.shuffle()
        dataManager.surName.shuffle()
        
        return dataManager
    }
}
